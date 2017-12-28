<?php

namespace app\controllers;

use Yii;
use app\models\Resep;
use app\models\ResepSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\RefResep;
use yii\helpers\ArrayHelper;
use app\models\Obat;
use app\base\Model;
use yii\web\Response;
use yii\widgets\ActiveForm;


/**
 * ResepController implements the CRUD actions for Resep model.
 */
class ResepController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Resep models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ResepSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Resep model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Resep model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Resep();
        $modelRef = [new RefResep];
        $data = ArrayHelper::map(Obat::find()->all(), 'id_obat', 'nama_obat');

        if ($model->load(Yii::$app->request->post())) {
            $model->created_at = time();
            $model->status = 0;
            //     $modelRef->id_resep = $model->id_resep;
            $modelRef = Model::createMultiple(RefResep::classname());
            Model::loadMultiple($modelRef, \Yii::$app->request->post());

            // ajax validation
            // if (Yii::$app->request->isAjax) {
            //     Yii::$app->response->format = Response::FORMAT_JSON;
            //     return ArrayHelper::merge(
            //         ActiveForm::validateMultiple($modelRef),
            //         ActiveForm::validate($model)
            //     );
            // }

            // validate all models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelRef) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        foreach ($modelRef as $modelRefs) {
                            $modelRefs->id_resep = $model->id;
                            if (! ($flag = $modelRefs->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                    return $this->render('create', [
                        'model' => $model,
                        'modelRef' => (empty($modelRef)) ? [new RefResep] : $modelRef,
                        'data' => $data,
                    ]);
                }
            }
        }
        else {
          return $this->render('create', [
              'model' => $model,
              'modelRef' => (empty($modelRef)) ? [new RefResep] : $modelRef,
              'data' => $data,
          ]);
        }
        // if ($model->load(Yii::$app->request->post())) {
        //     $model->created_at = time();
        //     $model->status = 0;
        //     $modelRef->id_resep = $model->id_resep;
        //
        //
        //     $model->save();
        //     $modelRef->save();
        //     return $this->redirect(['view', 'id' => $model->id_resep]);
        // } else {
        //     return $this->render('create', [
        //         'model' => $model,
        //         'modelRef' => empty($modelRef) ? [new RefResep] : $modelRef,
        //         'data' => $data,
        //     ]);
        // }
    }

    /**
     * Updates an existing Resep model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_resep]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Resep model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Resep model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Resep the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Resep::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

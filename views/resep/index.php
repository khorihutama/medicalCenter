<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ResepSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Reseps';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resep-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Resep', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id_resep',
            'nama_pasien',
            'created_at:date',
            // 'status',

            ['class' => 'yii\grid\ActionColumn',
            'template'=>'{view}',
            'buttons' => [
                'view' => function ($url, $model) {
                    return Html::a(
                                    '<i class="fa fa-binoculars"></i>', $url, ['class' => 'btn btn-info btn-xs']
                    );
                },
              ],
              ],
        ],
    ]); ?>
</div>

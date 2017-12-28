<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use wbraganca\dynamicform\DynamicFormWidget;

/* @var $this yii\web\View */
/* @var $model app\models\Resep */
/* @var $form yii\widgets\ActiveForm */

$data = yii\helpers\ArrayHelper::map(app\models\Obat::find()->select(['id_obat', 'nama_obat'] )->all(), 'id_obat', 'nama_obat');


?>

<div class="resep-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nama_pasien')->textInput(['maxlength' => true]) ?>

    <div id="list-obat">
        <div class="box box-default box-solid">
            <div class="box-header with-border">
                <h3 class="box-title">Obat</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool dynamic-add add-obat btn-success" data-count="0"><i class="fa fa-plus white" ></i></button>
                            <button type="button" class="btn btn-box-tool dynamic-remove remove-obat btn-danger"><i class="fa fa-minus white"></i></button>
                        </div>
                    </div>
                    <div class="box-body obat-wrapper">
                        <!-- < $form->field($model_obat, '[0]obat')->textInput()->label('Obat') ?> -->
                        <?= $form->field($model_obat, '[0]obat')->widget(Select2::classname(), [
                            'data' => $data,
                            'options' => ['placeholder' => 'Pilih obat ...'],
                            'pluginOptions' => [
                            'allowClear' => true
                            ],
                        ]); ?>
                        <?= $form->field($model_obat, '[0]dosis')->textInput()->label('Dosis') ?>

              </div>
        </div>
    </div>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

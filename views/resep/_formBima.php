<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use wbraganca\dynamicform\DynamicFormWidget;

/* @var $this yii\web\View */
/* @var $model app\models\Resep */
/* @var $form yii\widgets\ActiveForm */

$data = yii\helpers\ArrayHelper::map(app\models\Obat::find()->select(['id_obat', 'nama_obat'] )->all(), 'id_obat', 'nama_obat');

$script = <<< JS
alert('teloetl');
$('.content').on('click', '.add-obat', function(e) {
    var count = $(this).attr('data-count');
    count = parseInt(count)+1;
    $(this).attr('data-count', count);

    var help_block1 = $('<div></div>').addClass('help-block');
    var help_block2 = $('<div></div>').addClass('help-block');

    var form1 = $('<div></div>');
    form1.addClass('form-group field-refresep-' + count + '-obat required');
    var form2 = $('<div></div>');
    form2.addClass('form-group field-refresep-' + count + '-dosis required');

    var label1 = $('<label></label>').addClass('control-label').attr({
        for : 'refresep-' + count + '-obat'
    }).text('Obat');
    var label2 = $('<label></label>').addClass('control-label').attr({
        for : 'refresep-' + count + '-dosis'
    }).text('Dosis');

    var input1 = $('<input></input>').addClass('form-control').attr({
        id : 'refresep-' + count + '-obat',
        name : 'RefResep[' + count + '][obat]',
        type : 'text'
    });
    var input2 = $('<input></input>').addClass('form-control').attr({
        id : 'refresep-' + count + '-dosis',
        name : 'RefResep[' + count + '][dosis]',
        type : 'text'
    });

    form1.append(label1, input1, help_block1);
    form2.append(label2, input2, help_block2);
    $('.obat-wrapper').append(form1,form2);
    var add = {
        id : 'refresep-organisasi-' + count + '-detail',
        name : this.id,
        container : '.field-riwayat-organisasi-' + count + '-detail',
        error : '.help-block',
        message : 'tidak boleh kosong'
    };
    var formz = $('.resep-form form');
    formz.yiiActiveForm('add', {
      id : input1.attr('id'),
      name : input1.attr('id'),
      container : '.field-' + input1.attr('id'),
      input : '#' + input2.attr('id'),
      error : '.help-block',
      validate : function(attribute, value, message, deffered) {
        yii.validation.required(value, message, {message: 'tidak boleh kosong'});
      }
    });
    formz.yiiActiveForm('add', {
      id : input2.attr('id'),
      name : input2.attr('id'),
      container : '.field-' + input2.attr('id'),
      input : '#' + input2.attr('id'),
      error : '.help-block',
      validate : function(attribute, value, message, deffered) {
        yii.validation.required(value, message, {message: 'tidak boleh kosong'});
      }
    });
});
JS;

$this->registerJs($script);
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

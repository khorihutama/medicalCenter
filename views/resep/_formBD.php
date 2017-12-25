<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use wbraganca\dynamicform\DynamicFormWidget;

/* @var $this yii\web\View */
/* @var $model app\models\Resep */
/* @var $form yii\widgets\ActiveForm */
$data = yii\helpers\ArrayHelper::map(app\models\Obat::find()->select(['id_obat', 'nama_obat'] )->all(), 'id_obat', 'nama_obat');
//DynamicForm
$js = '
jQuery(".dynamicform_wrapper").on("afterInsert", function(e, item) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {
        jQuery(this).html("Address: " + (index + 1))
    });
});

jQuery(".dynamicform_wrapper").on("afterDelete", function(e) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {
        jQuery(this).html("Address: " + (index + 1))
    });
});
';

$this->registerJs($js);
?>

<div class="resep-form">

    <?php $form = ActiveForm::begin(['id' => 'dynamic-form']); ?>

    <?= $form->field($model, 'nama_pasien')->textInput(['maxlength' => true]) ?>

    //
    <?php DynamicFormWidget::begin([
       'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
       'widgetBody' => '.container-items', // required: css class selector
       'widgetItem' => '.item', // required: css class
       'limit' => 999, // the maximum times, an element can be cloned (default 999)
       'min' => 1, // 0 or 1 (default 1)
       'insertButton' => '.add-item', // css class
       'deleteButton' => '.remove-item', // css class
       'model' => $model[0],
       'formId' => 'dynamic-form',
       'formFields' => [
          'id_obat',
          'dosis',
          'status',
        ]
      ]); ?>
      <div class="panel panel-default">
              <div class="panel-heading">
                <div class="panel-heading">
                   <i class="fa fa-medkit"></i> Resep
                   <button type="button" class="pull-right add-item btn btn-success btn-xs"><i class="fa fa-plus"></i> Add prescription</button>
                 <div class="clearfix"></div>
              </div>

       <div class="panel-body container-items"><!-- widgetContainer -->
           <?php foreach ($model as $index => $model): ?>
               <div class="item panel panel-default"><!-- widgetBody -->
                   <div class="panel-heading">
                       <span class="panel-title-address">Address: <?= ($index + 1) ?></span>
                       <button type="button" class="pull-right remove-item btn btn-danger btn-xs"><i class="fa fa-minus"></i></button>
                       <div class="clearfix"></div>
                   </div>
                   <div class="panel-body">
                       <?php
                           // necessary for update action.
                           if (!$model->isNewRecord) {
                               echo Html::activeHiddenInput($model, "[{$index}]id");
                           }
                       ?>
    <!-- <= $form->field($model, 'id_obat')->textInput() ?> -->
                        <?= $form->field($model, "[{$index}]id_obat")->widget(Select2::classname(), [
                            'data' => $data,
                            'options' => ['placeholder' => 'Pilih obat ...'],
                            'pluginOptions' => [
                            'allowClear' => true
                            ],
                        ]); ?>

                        <div class="row">
                              <div class="col-sm-6">
                                  <?= $form->field($model, "[{$index}]dosis")->textInput() ?>
                              </div>
                              <div class="col-sm-6">
                                  <?= $form->field($model, "[{$index}]status")->textInput() ?>
                              </div>
                       </div>
                      </div>
                     </div>
                   </div>
               <?php endforeach; ?>
           </div>
       </div>
       <?php DynamicFormWidget::end(); ?>



    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

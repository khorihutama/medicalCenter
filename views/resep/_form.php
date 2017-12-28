<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use wbraganca\dynamicform\DynamicFormWidget;

/* @var $this yii\web\View */
/* @var $model app\models\Resep */
/* @var $form yii\widgets\ActiveForm */
// $data = yii\helpers\ArrayHelper::map(app\models\Obat::find()->select(['id_obat', 'nama_obat'] )->all(), 'id_obat', 'nama_obat');

$script = <<< JS
$(".dynamicform_wrapper").on("beforeInsert", function(e, item) {
    console.log("beforeInsert");
});

$(".dynamicform_wrapper").on("afterInsert", function(e, item) {
    console.log("afterInsert");
});

$(".dynamicform_wrapper").on("beforeDelete", function(e, item) {
    if (! confirm("Yakin akan menghapusnya?")) {
        return false;
    }
    return true;
});

$(".dynamicform_wrapper").on("afterDelete", function(e) {
    console.log("Item terhapus!");
});

$(".dynamicform_wrapper").on("limitReached", function(e, item) {
    alert("Batas maksimal");
});
JS;
$this->registerJs($script, 3);

?>

<div class="resep-form">

    <?php $form = ActiveForm::begin(['id' => 'dynamic-form']); ?>

    <?= $form->field($model, 'nama_pasien')->textInput(['maxlength' => true]) ?>

    <!-- <div class="rows"> -->
      <div class="panel panel-default">
       <div class="panel-heading"><h4><i class="fa fa-pencil"></i> Resep</h4></div>
       <div class="panel-body">
            <?php DynamicFormWidget::begin([
               'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
               'widgetBody' => '.container-items', // required: css class selector
               'widgetItem' => '.item', // required: css class
               'limit' => 20, // the maximum times, an element can be cloned (default 999)
               'min' => 1, // 0 or 1 (default 1)
               'insertButton' => '.tambah-item', // css class
               'deleteButton' => '.hapus-item', // css class
               'model' => $modelRef[0],
               'formId' => 'dynamic-form',
               'formFields' => [
                   'obat',
                   'dosis',
               ],
           ]); ?>

           <div class="container-items"><!-- widgetContainer -->
           <?php foreach ($modelRef as $i => $modelRefs): ?>
               <div class="item panel panel-default"><!-- widgetBody -->
                   <div class="panel-heading">
                       <h3 class="panel-title pull-left">Obat ke-<?= $i + 1 ?></h3>
                       <div class="pull-right">
                         <button type="button" class="tambah-item btn btn-success btn-xs"><i class="fa fa-plus"></i></button>
                         <button type="button" class="hapus-item btn btn-danger btn-xs"><i class="fa fa-minus"></i></button>
                       </div>
                       <div class="clearfix"></div>
                   </div>
                   <div class="panel-body">
                       <?php
                           // necessary for update action.
                           if (!$modelRefs->isNewRecord) {
                               echo Html::activeHiddenInput($modelRefs, "[{$i}]id");
                           }
                       ?>
                       <!-- <= $form->field($modelsObat, "[{$i}]full_name")->textInput(['maxlength' => true]) ?> -->
                       <div class="row">
                            <div class="col-sm-6">
                         <?= $form->field($modelRefs, "[{$i}]obat")->widget(Select2::classname(), [
                             'data' => $data,
                             'options' => ['placeholder' => 'Pilih obat ...'],
                             'pluginOptions' => [
                             'allowClear' => true
                             ],
                         ])->label('Obat') ?>
                       </div>
                           <div class="col-sm-6">
                             <?= $form->field($modelRefs, "[{$i}]dosis")->textInput(['maxlength' => true]) ?>
                           </div>
                       </div><!-- .row -->
                   </div>
               </div>
           <?php endforeach; ?>
           </div>
           <?php DynamicFormWidget::end(); ?>
       </div>
     </div>
    <!-- </div> -->

    <!-- <div class="form-group">
        < Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div> -->
    <div class="form-group">
        <?= Html::submitButton('<i class="fa fa-check"></i> Simpan', ['class' => $model->isNewRecord ? 'btn btn-success btn-addon' : 'btn btn-primary btn-addon']) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div>

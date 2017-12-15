<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Obat */

$this->title = 'Update Obat: ' . $model->id_obat;
$this->params['breadcrumbs'][] = ['label' => 'Obats', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_obat, 'url' => ['view', 'id' => $model->id_obat]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="obat-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

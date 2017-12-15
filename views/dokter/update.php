<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Dokter */

$this->title = 'Update Dokter: ' . $model->id_dokter;
$this->params['breadcrumbs'][] = ['label' => 'Dokters', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_dokter, 'url' => ['view', 'id' => $model->id_dokter]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="dokter-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

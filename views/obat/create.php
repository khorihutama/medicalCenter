<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Obat */

$this->title = 'Create Obat';
$this->params['breadcrumbs'][] = ['label' => 'Obats', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="obat-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

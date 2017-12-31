<?php
use yii\helpers\Html;

/* @var $this \yii\web\View */
/* @var $content string */
?>

<header class="main-header">

    <?= Html::a('<span class="logo-mini">APP</span><span class="logo-lg">' . Yii::$app->name . '</span>', Yii::$app->homeUrl, ['class' => 'logo']) ?>

    <nav class="navbar navbar-static-top" role="navigation">

        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">

            <ul class="nav navbar-nav">

                <!-- Messages: style can be found in dropdown.less-->

                <!-- User Account: style can be found in dropdown.less -->

                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<?= $directoryAsset ?>/img/avatar5.png" class="user-image" alt="User Image"/>
                        <span class="hidden-xs"><?= (!Yii::$app->user->isGuest) ? Yii::$app->user->identity->username : 'Medical' ?></span>

                    </a>

                    <ul class="dropdown-menu">
                        <?php if(Yii::$app->user->isGuest) { ?>

                        <li class="user-header">
                            <img src="<?= $directoryAsset ?>/img/avatar5.png" class="img-circle"
                                 alt="User Image"/>
                            <p>
                                Medical Center
                            </p>
                        </li>

                        <li class="user-body">
                          <div class="col-xs-4 text-center"></div>
                          <div class="col-xs-4 text-center">
                            <?= Html::a(
                                'Login',
                                ['/site/login'],
                                ['data-method' => 'post', 'class' => 'btn btn-default btn-flat']
                            ) ?>
                          </div>
                          <div class="col-xs-4 text-center"><div>

                      <?php } else { ?>

                        <!-- User image -->
                        <li class="user-header">
                            <img src="<?= $directoryAsset ?>/img/avatar5.png" class="img-circle"
                                 alt="User Image"/>
                            <p>
                              <?= (!Yii::$app->user->isGuest) ? Yii::$app->user->identity->username : 'Medical Center UNS' ?>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="col-xs-4 text-center"></div>
                            <div class="col-xs-4 text-center">
                              <?= Html::a(
                                  'Sign out',
                                  ['/site/logout'],
                                  ['data-method' => 'post', 'class' => 'btn btn-default btn-flat']
                              ) ?>
                            </div>
                            <div class="col-xs-4 text-center"></div>
                        </li>
                        <!-- Menu Footer-->

                        <!-- <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                < Html::a(
                                    'Sign out',
                                    ['/site/logout'],
                                    ['data-method' => 'post', 'class' => 'btn btn-default btn-flat']
                                ) ?>
                            </div>
                        </li> -->
                    </ul>
                  <?php } ?>
                </li>

                <!-- User Account: style can be found in dropdown.less -->
                <!-- <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li> -->
            </ul>
        </div>
    </nav>
</header>

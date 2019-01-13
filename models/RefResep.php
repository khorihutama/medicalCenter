<?php

namespace app\models;

use Yii;
use app\models\Obat;

/**
 * This is the model class for table "ref_resep".
 *
 * @property integer $id
 * @property integer $id_resep
 * @property string $obat
 * @property integer $dosis
 */
class RefResep extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ref_resep';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_resep', 'obat', 'dosis'], 'required'],
            [['id_resep', 'dosis'], 'integer'],
            [['obat'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_resep' => 'Id Resep',
            'obat' => 'Obat',
            'dosis' => 'Dosis',
        ];
    }



    public function getObats()
    {
        return $this->hasOne(Obat::className(), ['id_obat' => 'obat']);
    }
}

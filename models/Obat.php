<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "obat".
 *
 * @property integer $id_obat
 * @property string $nama_obat
 * @property string $cara_pemakaian
 * @property integer $stock
 */
class Obat extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'obat';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama_obat', 'cara_pemakaian', 'stock'], 'required'],
            [['stock'], 'integer'],
            [['nama_obat', 'cara_pemakaian'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_obat' => 'Id Obat',
            'nama_obat' => 'Nama Obat',
            'cara_pemakaian' => 'Cara Pemakaian',
            'stock' => 'Stock',
        ];
    }
}

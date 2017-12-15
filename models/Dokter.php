<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dokter".
 *
 * @property integer $id_dokter
 * @property string $nama
 * @property string $spesialisasi
 * @property integer $id_user
 */
class Dokter extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dokter';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama', 'spesialisasi', 'id_user'], 'required'],
            [['id_user'], 'integer'],
            [['nama', 'spesialisasi'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_dokter' => 'Id Dokter',
            'nama' => 'Nama',
            'spesialisasi' => 'Spesialisasi',
            'id_user' => 'Id User',
        ];
    }
}

<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "resep".
 *
 * @property integer $id_resep
 * @property string $nama_pasien
 * @property integer $id_obat
 * @property integer $dosis
 * @property integer $status
 */
class Resep extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'resep';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama_pasien', 'id_obat', 'dosis'], 'required'],
            [['id_obat', 'dosis', 'status'], 'integer'],
            [['nama_pasien'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_resep' => 'Id Resep',
            'nama_pasien' => 'Nama Pasien',
            'id_obat' => 'Nama Obat',
            'dosis' => 'Dosis',
            'status' => 'Status',
        ];
    }

    public function getObat(){
      return $this->hasOne(Obat::className(), ['id_obat' => 'id_obat']);
    }
}

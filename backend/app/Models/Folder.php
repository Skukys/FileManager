<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Folder extends Model
{
    protected $table = 'folders';
    protected $fillable = ['root_id', 'name'];

    public function getChildren()
    {
        $folders = Folder::where('root_id', $this->id)->get();
        $tree = [
            'name' => $this->name,
            'id' => $this->id,
            'children' => []
        ];
        foreach ($folders as $folder) {
            $tree['children'][] = $folder->getChildren();
        }
        return $tree;
    }


    use HasFactory;
}

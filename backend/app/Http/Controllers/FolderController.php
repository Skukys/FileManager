<?php

namespace App\Http\Controllers;

use App\Models\Folder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FolderController extends Controller
{
    public function create(Request $request)
    {
        $validation = Validator::make($request->all(), ['name' => 'required']);
        if($validation->fails()) return response(['body' => $validation->errors()]);
        Folder::create(['root_id' => $request->id, 'name' => $request->name]);
        return response([
            'message' => 'Folder is create'
        ],201);
    }

    public function showFolderTree(Request $request)
    {
        $folder = Folder::find($request->id)->first();
        $response = $folder->getChildren();
        return response(['body' => $response],200);
    }
}

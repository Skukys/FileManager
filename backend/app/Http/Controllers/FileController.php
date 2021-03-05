<?php

namespace App\Http\Controllers;

use App\Http\Resources\FileResource;
use App\Http\Resources\FolderResource;
use App\Models\File;
use App\Models\Folder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class FileController extends Controller
{

    public function upload(Request $request)
    {
        $validation = Validator::make($request->all(), ['file' => 'image|required']);
        if($validation->fails()) return response(['body' => $validation->errors()],422);

        $path = $request->file('file')->store('images');
        $extension = $request->file->extension();
        $name = explode('.', $request->file('file')->getClientOriginalName());

        File::create([
            'path' => $path,
            'extension' => $extension,
            'root_id' => $request->id,
            'name' => $name[0]
        ]);

        return response(['body' => [
            'message' => 'Success'
        ]],201);
    }

    public function getFiles(Request $request)
    {
        $folder = Folder::find($request->id);
        $folders = Folder::where('root_id', $folder->id)->get();
        $files = File::where('root_id', $folder->id)->get();
        return response([
            'body' =>[
                'id' => $folder->id,
                'name' => $folder->name,
                'files' => FileResource::collection($files),
                'folders' => FolderResource::collection($folders),
            ]
        ],200);
    }
}

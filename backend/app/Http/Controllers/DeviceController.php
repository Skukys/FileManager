<?php

namespace App\Http\Controllers;

use App\Http\Resources\DeviceResource;
use App\Models\Device;
use Illuminate\Http\Request;

class DeviceController extends Controller
{

    public function devises(Request $request)
    {
        return response([
            'body' => DeviceResource::collection(Device::all())
        ],200);
    }
}

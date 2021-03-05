<?php

namespace App\Http\Controllers;

use App\Models\Device;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function auth(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'login' => 'required',
            'password' => 'required',
        ]);

        if ($validation->fails()) return response(['body' => $validation->errors()], 422);

        $user = User::where('login', $request->login)->first();
        if(Hash::check($request->password, $user->password)){
            $token = Str::random(32);
            Device::create([
                'api_token' => $token
            ]);
            return response([
                'body' => [
                    'message' => 'Authorization successful',
                    'token' => $token
                ]
            ],200);
        } else {
            return response([
                'body' => [
                    'message' => 'Error authorization'
                ]
            ],401);
        }
    }

    public function register(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'login' => 'required',
            'password' => 'regex:/(?=.*[0-9]{2,})(?=.*[a-z])(?=.*[A-Z])/|min:5|max:10'
        ]);

        if ($validation->fails()) return response(['body' => $validation->errors()], 424);

        if (User::where('login', $request->login)->first()) return response(['body' => ['this login is already taken']], 401);


        User::create([
            'login' => $request->login,
            'password' => Hash::make($request->password),
        ]);


        return response([
            'body' => [
                'successful'
            ]
        ], 201);
    }

    public function logout(Request $request)
    {
        $token = $request->bearerToken();
        $device = Device::where('api_token', $token)->first();
        if($device){
            $device->delete();
            return response(['body' => ['message' => 'Success logout']],200);
        }

        return response(['body' => ['message' => 'Error logout']],401);

    }
}

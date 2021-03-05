<?php

namespace App\Http\Middleware;

use App\Models\Device;
use Closure;
use Illuminate\Http\Request;

class checkAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $devise = Device::where('api_token', $request->bearerToken())->first();

        if(!$devise || !$request->bearerToken()){
            return response([
                'error' => [
                    'code' => 401,
                    'message' => 'Unauthorized'
                ]
            ]);
        }

        return $next($request);
    }
}

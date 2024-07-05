<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class AuthenticatedSessionController extends Controller
{
    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): JsonResponse
    {
        $request->authenticate();

        $user = $request->user();

        // Revoke existing tokens
        $user->tokens()->delete();
        

        // Create a new token
        $token = $user->createToken('api-token');

        return response()->json([
            'status' => 'Login successfully',
            'user' => $user,
            'token' => $token->plainTextToken
        ]);
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request)
    {
        // Get the authenticated user
        $user = $request->user();

        if ($user) {
            // Revoke all tokens
            $user->tokens()->delete();

            // // Invalidate the session
            // $request->session()->invalidate();
            // $request->session()->regenerateToken();

            return response()->json(['message' => 'Successfully logged out']);
        }

        return response()->json(['message' => 'User not authenticated'], 401);
    }
}

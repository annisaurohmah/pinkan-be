<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        \App\Models\User::factory(10)->create();

        \App\Models\User::factory()->create([
            'first_name' => 'Test',
            'last_name' => 'User',
            'username' => 'testuser', // 'username' is unique, so it must be unique
            'date_of_birth' => '1990-01-01', // 'date_of_birth' is a date field
            'email' => 'test@example.com',
            'password' => bcrypt('password'),
            
        ]);
    }
}

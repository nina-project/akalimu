<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //get all count of jobs per month starting with current month back 12 months
        $jobs = \App\Models\Job::selectRaw('count(*) as count, MONTH(created_at) month, YEAR(created_at) year')
            ->where('created_at', '>=', \Carbon\Carbon::now()->subMonths(12))
            ->groupBy('month', 'year')
            ->orderBy('year', 'asc')
            ->orderBy('month', 'asc')
            ->get();
        return view('dashboards.home');
    }
}

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
        //count jobs grouped by month for the past 12 months from current month
        $jobs = \App\Models\Job::selectRaw('count(*) as count, MONTH(created_at) month, YEAR(created_at) year')
            ->where('created_at', '>=', \Carbon\Carbon::now()->subMonths(12))
            ->groupBy('month', 'year')
            ->orderBy('year', 'asc')
            ->orderBy('month', 'asc')
            ->pluck('count')->toArray();
        return view('dashboards.home')->with('jobs', $jobs);
    }
}

@extends('layouts.app')

@section('content')
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Dashboard</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>


    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-6">

                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>{{ App\Models\User::count() }}</h3>
                            <p>Users</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                        <a href="{{ url('users') }}" class="small-box-footer">More info <i
                                class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-3 col-6">

                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>{{ App\Models\Category::count() }}</h3>
                            <p>Job Categories</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person-add"></i>
                        </div>
                        <a href="{{ url('categories') }}" class="small-box-footer">More info <i
                                class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-3 col-6">

                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>{{ App\Models\Job::count() }}</h3>
                            <p>Jobs</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                        <a href="{{ url('jobs') }}" class="small-box-footer">More info <i
                                class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>



                <div class="col-lg-3 col-6">

                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3>65</h3>
                            <p>Unique Visitors</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">

                        <div class="card-header border-0">
                            <div class="d-flex justify-content-between">
                                <h3 class="card-title">Jobs</h3>
                                <a href="{{ url('jobs')}}">View Report</a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex">
                                <p class="d-flex flex-column">
                                    <span class="text-bold text-lg"></span>
                                    <span>Jobs Over Time</span>
                                </p>
                                <p class="ml-auto d-flex flex-column text-right">
                                    <span class="text-success">
                                        <i class="fas fa-arrow-up"></i> 33.1%
                                    </span>
                                    <span class="text-muted">Since last month</span>
                                </p>
                            </div>

                            <div class="position-relative mb-4">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class=""></div>
                                    </div>
                                </div>
                                <canvas id="sales-year-chart" style="display: block; width: 495px; height: 200px;"
                                    class="chartjs-render-monitor" width="495" height="200"></canvas>
                            </div>
                            <div class="d-flex flex-row justify-content-end">
                                <span class="mr-2">
                                    <i class="fas fa-square text-primary"></i> This year
                                </span>
                                {{-- <span>
                                    <i class="fas fa-square text-gray"></i> Last year
                                </span> --}}
                            </div>
                        </div>
                    </div>
                </div>
                {{-- <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header border-0">
                            <div class="d-flex justify-content-between">
                                <h3 class="card-title">Online Store Visitors</h3>
                                <a href="javascript:void(0);">View Report</a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex">
                                <p class="d-flex flex-column">
                                    <span class="text-bold text-lg">820</span>
                                    <span>Visitors Over Time</span>
                                </p>
                                <p class="ml-auto d-flex flex-column text-right">
                                    <span class="text-success">
                                        <i class="fas fa-arrow-up"></i> 12.5%
                                    </span>
                                    <span class="text-muted">Since last week</span>
                                </p>
                            </div>

                            <div class="position-relative mb-4">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class=""></div>
                                    </div>
                                </div>
                                <canvas id="visitors-chart" style="display: block; width: 495px; height: 200px;"
                                    class="chartjs-render-monitor" width="495" height="200"></canvas>
                            </div>
                            <div class="d-flex flex-row justify-content-end">
                                <span class="mr-2">
                                    <i class="fas fa-square text-primary"></i> This Week
                                </span>
                                <span>
                                    <i class="fas fa-square text-gray"></i> Last Week
                                </span>
                            </div>
                        </div>
                    </div>



                </div>

                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header border-0">
                            <div class="d-flex justify-content-between">
                                <h3 class="card-title">Sales</h3>
                                <a href="javascript:void(0);">View Report</a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex">
                                <p class="d-flex flex-column">
                                    <span class="text-bold text-lg">$18,230.00</span>
                                    <span>Sales Over Time</span>
                                </p>
                                <p class="ml-auto d-flex flex-column text-right">
                                    <span class="text-success">
                                        <i class="fas fa-arrow-up"></i> 33.1%
                                    </span>
                                    <span class="text-muted">Since last month</span>
                                </p>
                            </div>

                            <div class="position-relative mb-4">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class=""></div>
                                    </div>
                                </div>
                                <canvas id="sales-chart" style="display: block; width: 495px; height: 200px;"
                                    class="chartjs-render-monitor" width="495" height="200"></canvas>
                            </div>
                            <div class="d-flex flex-row justify-content-end">
                                <span class="mr-2">
                                    <i class="fas fa-square text-primary"></i> This year
                                </span>
                                <span>
                                    <i class="fas fa-square text-gray"></i> Last year
                                </span>
                            </div>
                        </div>
                    </div>
                </div> --}}

            </div>

        </div>

    </div>
@endsection

@push('third_party_scripts')
    <script src="{{ URL::asset('assets/plugins/chart.js/Chart.min.js') }}"></script>
@endpush

@push('page_scripts')
    <script>
        /* global Chart:false */

        $(function() {
            'use strict'

            var ticksStyle = {
                fontColor: '#495057',
                fontStyle: 'bold'
            }

            var mode = 'index'
            var intersect = true


            var $salesChart = $('#sales-year-chart')
            // eslint-disable-next-line no-unused-vars
            var salesChart = new Chart($salesChart, {
                type: 'bar',
                data: {
                    //get the previous 
                    labels: pastMonths(),
                    datasets: [{
                            backgroundColor: '#007bff',
                            borderColor: '#007bff',
                            data: @json($jobs),
                        }
                    ]
                },
                options: {
                    maintainAspectRatio: false,
                    tooltips: {
                        mode: mode,
                        intersect: intersect
                    },
                    hover: {
                        mode: mode,
                        intersect: intersect
                    },
                    legend: {
                        display: false
                    },
                    scales: {
                        yAxes: [{
                            // display: false,
                            gridLines: {
                                display: true,
                                lineWidth: '4px',
                                color: 'rgba(0, 0, 0, .2)',
                                zeroLineColor: 'transparent'
                            },
                            ticks: $.extend({
                                beginAtZero: true,

                                // // Include a dollar sign in the ticks
                                // callback: function(value) {
                                //     if (value >= 1000) {
                                //         value /= 1000
                                //         value += 'k'
                                //     }

                                //     return '$' + value
                                // }
                            }, ticksStyle)
                        }],
                        xAxes: [{
                            display: true,
                            gridLines: {
                                display: false
                            },
                            ticks: ticksStyle
                        }]
                    }
                }
            });

            function formatDate(date) {
                //if ends with 1 append st if 2 append nd if 3 append rd else append th
                if (date % 10 == 1 && date != 11) {
                    date = date + "st"
                } else if (date % 10 == 2 && date != 12) {
                    date = date + "nd"
                } else if (date % 10 == 3 && date != 13) {
                    date = date + "rd"
                } else {
                    date = date + "th"
                }
                return date;
            }

            function pastweek() {
                var now = new Date(),
                    i = 6,
                    dates = [formatDate(now.getDate())];
                while (i--) {
                    now.setDate(now.getDate() - 1);
                    dates.push(formatDate(now.getDate()));
                }
                return dates.reverse();
            }

            function pastMonths() {
                var date = new Date();
                var dates = [];
                var i, len;
                dates.unshift(date.toLocaleString('en-us', {
                    month: 'short'
                }));
                for (i = 0, len = 11; i < len; i++) {
                    date.setMonth(date.getMonth() - 1);

                    dates.unshift(date.toLocaleString('en-us', {
                        month: 'short'
                    }));
                }
                return dates;
            }

            // var $visitorsChart = $('#visitors-chart')
            // // eslint-disable-next-line no-unused-vars
            // var visitorsChart = new Chart($visitorsChart, {
            //     data: {
            //         labels: pastweek(),
            //         datasets: [{
            //                 type: 'line',
            //                 data: [100, 120, 170, 167, 180, 177, 160],
            //                 backgroundColor: 'transparent',
            //                 borderColor: '#007bff',
            //                 pointBorderColor: '#007bff',
            //                 pointBackgroundColor: '#007bff',
            //                 fill: false
            //                 // pointHoverBackgroundColor: '#007bff',
            //                 // pointHoverBorderColor    : '#007bff'
            //             },
            //             {
            //                 type: 'line',
            //                 data: [60, 80, 70, 67, 80, 77, 100],
            //                 backgroundColor: 'tansparent',
            //                 borderColor: '#ced4da',
            //                 pointBorderColor: '#ced4da',
            //                 pointBackgroundColor: '#ced4da',
            //                 fill: false
            //                 // pointHoverBackgroundColor: '#ced4da',
            //                 // pointHoverBorderColor    : '#ced4da'
            //             }
            //         ]
            //     },
            //     options: {
            //         maintainAspectRatio: false,
            //         tooltips: {
            //             mode: mode,
            //             intersect: intersect
            //         },
            //         hover: {
            //             mode: mode,
            //             intersect: intersect
            //         },
            //         legend: {
            //             display: false
            //         },
            //         scales: {
            //             yAxes: [{
            //                 // display: false,
            //                 gridLines: {
            //                     display: true,
            //                     lineWidth: '4px',
            //                     color: 'rgba(0, 0, 0, .2)',
            //                     zeroLineColor: 'transparent'
            //                 },
            //                 ticks: $.extend({
            //                     beginAtZero: true,
            //                     suggestedMax: 200
            //                 }, ticksStyle)
            //             }],
            //             xAxes: [{
            //                 display: true,
            //                 gridLines: {
            //                     display: false
            //                 },
            //                 ticks: ticksStyle
            //             }]
            //         }
            //     }
            // })
        })

        // lgtm [js/unused-local-variable]
    </script>
@endpush

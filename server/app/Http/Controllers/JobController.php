<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateJobRequest;
use App\Http\Requests\UpdateJobRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\Job;
use Illuminate\Http\Request;
use App\Models\Category;
use Flash;
use Response;

class JobController extends AppBaseController
{
    /**
     * Display a listing of the Job.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var Job $jobs */
        $jobs = Job::latest()->with('categories','postedBy')->paginate(10);

        return view('jobs.index')
            ->with('jobs', $jobs);
    }

    /**
     * Show the form for creating a new Job.
     *
     * @return Response
     */
    public function create()
    {
        $categories = Category::pluck('name','id');
        return view('jobs.create')->with('categories', $categories);
    }

    /**
     * Store a newly created Job in storage.
     *
     * @param CreateJobRequest $request
     *
     * @return Response
     */
    public function store(CreateJobRequest $request)
    {
        $input = $request->all();
        $input['posted_by'] = auth()->user()->id;

        /** @var Job $job */
        $job = Job::create($input);

        Flash::success('Job saved successfully.');

        return redirect(route('jobs.index'));
    }

    /**
     * Display the specified Job.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Job $job */
        $job = Job::find($id);

        if (empty($job)) {
            Flash::error('Job not found');

            return redirect(route('jobs.index'));
        }

        return view('jobs.show')->with('job', $job);
    }

    /**
     * Show the form for editing the specified Job.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var Job $job */
        $job = Job::find($id);

        if (empty($job)) {
            Flash::error('Job not found');

            return redirect(route('jobs.index'));
        }

        return view('jobs.edit')->with('job', $job);
    }

    /**
     * Update the specified Job in storage.
     *
     * @param int $id
     * @param UpdateJobRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateJobRequest $request)
    {
        /** @var Job $job */
        $job = Job::find($id);

        if (empty($job)) {
            Flash::error('Job not found');

            return redirect(route('jobs.index'));
        }

        $job->fill($request->all());
        $job->save();

        Flash::success('Job updated successfully.');

        return redirect(route('jobs.index'));
    }

    /**
     * Remove the specified Job from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Job $job */
        $job = Job::find($id);

        if (empty($job)) {
            Flash::error('Job not found');

            return redirect(route('jobs.index'));
        }

        $job->delete();

        Flash::success('Job deleted successfully.');

        return redirect(route('jobs.index'));
    }
}

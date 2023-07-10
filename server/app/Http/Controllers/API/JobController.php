<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateJobAPIRequest;
use App\Http\Requests\API\UpdateJobAPIRequest;
use App\Models\Job;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use Response;


/**
 * Class JobController
 * @package App\Http\Controllers\API
 */

class JobController extends AppBaseController
{
    /**
     * Display a listing of the Job.
     * GET|HEAD /jobs
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $query = Job::query();

        if ($request->get('skip')) {
            $query->skip($request->get('skip'));
        }
        if ($request->get('limit')) {
            $query->limit($request->get('limit'));
        }

        $jobs = $query->get()->map ( function ($job) {
            $job['categories'] = Job::find($job->id)->categories;
            return $job;
        });

        return $this->sendResponse($jobs->toArray(), 'Jobs retrieved successfully');
    }

    /**
     * Store a newly created Job in storage.
     * POST /jobs
     *
     * @param CreateJobAPIRequest $request
     *
     * @return Response
     */
    public function store(CreateJobAPIRequest $request)
    {

        $input = $request->all();
        $input['posted_by'] = auth()->user()->id;

        $categories = $input['categories'];
        // /** @var Job $job */
        $job = Job::create($input);
        $job->categories()->attach($categories);
        $jobArray = $job->toArray();
        $jobArray['categories'] = $job->categories;

        return $this->sendResponse($jobArray, 'Job saved successfully');
    }

    /**
     * Display the specified Job.
     * GET|HEAD /jobs/{id}
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
            return $this->sendError('Job not found');
        }
        $jobArray = $job->toArray();
        $jobArray['categories'] = $job->categories;

        return $this->sendResponse($jobArray, 'Job retrieved successfully');
    }

    /**
     * Update the specified Job in storage.
     * PUT/PATCH /jobs/{id}
     *
     * @param int $id
     * @param UpdateJobAPIRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateJobAPIRequest $request)
    {
        // /** @var Job $job */
        $job = Job::find($id);

        if (empty($job)) {
            return $this->sendError('Job not found');
        }

        $job->fill($request->all());
        $job->categories()->sync($request->categories);
        $job->save();

        return $this->sendResponse($job->toArray(), 'Job updated successfully');
    }

    /**
     * Remove the specified Job from storage.
     * DELETE /jobs/{id}
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
            return $this->sendError('Job not found');
        }

        $job->delete();

        return $this->sendSuccess('Job deleted successfully');
    }
    /**
     * Get jobs that are recommended for me
     */
    public function recommended()
    {
        $current_user = auth()->user();
        $recommend_jobs = $current_user->jobrecommendations()->orderBy('score', 'desc')->get();
        
        return $this->sendResponse($recommend_jobs->toArray(), 'Recommended jobs retrieved successfully');

    }

    /**
     * Get my jobs
     */
    public function jobsByUser($user_id)
    {
        $user = User::find($user_id);
        if (empty($user)) {
            return $this->sendError('User not found');
        }

        $jobs = Job::where('posted_by', $user_id)->get()->toArray();
        return $this->sendResponse($jobs, 'Jobs retrieved successfully');
    }

    /**
     * Get recommendations for a job
     */
    public function recommendations($job_id) 
    {
        $job = Job::find($job_id);
        if (empty($job)) {
            return $this->sendError('Job not found');
        }

        $recommend_jobs = $job->jobrecommendations()->orderBy('score', 'desc')->get();

        return $this->sendResponse($recommend_jobs->toArray(), 'Job Recommended People retrieved successfully');

    }
}

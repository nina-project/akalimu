<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateJobAPIRequest;
use App\Http\Requests\API\UpdateJobAPIRequest;
use App\Models\Job;
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

        $jobs = $query->get();

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

        /** @var Job $job */
        $job = Job::create($input);

        return $this->sendResponse($job->toArray(), 'Job saved successfully');
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

        return $this->sendResponse($job->toArray(), 'Job retrieved successfully');
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
        return $this->sendError('Not implemented');
        // /** @var Job $job */
        // $job = Job::find($id);

        // if (empty($job)) {
        //     return $this->sendError('Job not found');
        // }

        // $job->fill($request->all());
        // $job->save();

        // return $this->sendResponse($job->toArray(), 'Job updated successfully');
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
}

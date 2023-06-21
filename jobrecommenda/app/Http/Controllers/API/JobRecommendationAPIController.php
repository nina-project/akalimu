<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateJobRecommendationAPIRequest;
use App\Http\Requests\API\UpdateJobRecommendationAPIRequest;
use App\Models\JobRecommendation;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use Response;

/**
 * Class JobRecommendationController
 * @package App\Http\Controllers\API
 */

class JobRecommendationAPIController extends AppBaseController
{
    /**
     * Display a listing of the JobRecommendation.
     * GET|HEAD /jobRecommendations
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $query = JobRecommendation::query();

        if ($request->get('skip')) {
            $query->skip($request->get('skip'));
        }
        if ($request->get('limit')) {
            $query->limit($request->get('limit'));
        }

        $jobRecommendations = $query->get();

        return $this->sendResponse($jobRecommendations->toArray(), 'Job Recommendations retrieved successfully');
    }

    /**
     * Store a newly created JobRecommendation in storage.
     * POST /jobRecommendations
     *
     * @param CreateJobRecommendationAPIRequest $request
     *
     * @return Response
     */
    public function store(CreateJobRecommendationAPIRequest $request)
    {
        $input = $request->all();

        /** @var JobRecommendation $jobRecommendation */
        $jobRecommendation = JobRecommendation::create($input);

        return $this->sendResponse($jobRecommendation->toArray(), 'Job Recommendation saved successfully');
    }

    /**
     * Display the specified JobRecommendation.
     * GET|HEAD /jobRecommendations/{id}
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var JobRecommendation $jobRecommendation */
        $jobRecommendation = JobRecommendation::find($id);

        if (empty($jobRecommendation)) {
            return $this->sendError('Job Recommendation not found');
        }

        return $this->sendResponse($jobRecommendation->toArray(), 'Job Recommendation retrieved successfully');
    }

    /**
     * Update the specified JobRecommendation in storage.
     * PUT/PATCH /jobRecommendations/{id}
     *
     * @param int $id
     * @param UpdateJobRecommendationAPIRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateJobRecommendationAPIRequest $request)
    {
        /** @var JobRecommendation $jobRecommendation */
        $jobRecommendation = JobRecommendation::find($id);

        if (empty($jobRecommendation)) {
            return $this->sendError('Job Recommendation not found');
        }

        $jobRecommendation->fill($request->all());
        $jobRecommendation->save();

        return $this->sendResponse($jobRecommendation->toArray(), 'JobRecommendation updated successfully');
    }

    /**
     * Remove the specified JobRecommendation from storage.
     * DELETE /jobRecommendations/{id}
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var JobRecommendation $jobRecommendation */
        $jobRecommendation = JobRecommendation::find($id);

        if (empty($jobRecommendation)) {
            return $this->sendError('Job Recommendation not found');
        }

        $jobRecommendation->delete();

        return $this->sendSuccess('Job Recommendation deleted successfully');
    }
}

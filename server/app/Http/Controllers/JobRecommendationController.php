<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateJobRecommendationRequest;
use App\Http\Requests\UpdateJobRecommendationRequest;
use App\Http\Controllers\AppBaseController;
use App\Services\JobRecommendationService;
use App\Models\JobRecommendation;
use Illuminate\Http\Request;
use App\Models\User;
use Flash;
use Response;

class JobRecommendationController extends AppBaseController
{
    /**
     * Display a listing of the JobRecommendation.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request, JobRecommendationService $jobRecommendationService)
    {

        /** @var JobRecommendation $jobRecommendations */
        $jobRecommendations = JobRecommendation::orderBy('score', 'desc')->get();

        return view('job_recommendations.index')
            ->with('jobRecommendations', $jobRecommendations);
    }

    /**
     * Show the form for creating a new JobRecommendation.
     *
     * @return Response
     */
    public function create(Request $request, JobRecommendationService $jobRecommendationService)
    {
        $users = User::all();
        //get all recommendations
        foreach ($users as $user) {
            $jobRecommendationService->recommendJobs($user);
        }

        return redirect(route('jobRecommendations.index'));
    }

    /**
     * Store a newly created JobRecommendation in storage.
     *
     * @param CreateJobRecommendationRequest $request
     *
     * @return Response
     */
    public function store(CreateJobRecommendationRequest $request)
    {
        $input = $request->all();

        /** @var JobRecommendation $jobRecommendation */
        $jobRecommendation = JobRecommendation::create($input);

        Flash::success('Job Recommendation saved successfully.');

        return redirect(route('jobRecommendations.index'));
    }

    /**
     * Display the specified JobRecommendation.
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
            Flash::error('Job Recommendation not found');

            return redirect(route('jobRecommendations.index'));
        }

        return view('job_recommendations.show')->with('jobRecommendation', $jobRecommendation);
    }

    /**
     * Show the form for editing the specified JobRecommendation.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var JobRecommendation $jobRecommendation */
        $jobRecommendation = JobRecommendation::find($id);

        if (empty($jobRecommendation)) {
            Flash::error('Job Recommendation not found');

            return redirect(route('jobRecommendations.index'));
        }

        return view('job_recommendations.edit')->with('jobRecommendation', $jobRecommendation);
    }

    /**
     * Update the specified JobRecommendation in storage.
     *
     * @param int $id
     * @param UpdateJobRecommendationRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateJobRecommendationRequest $request)
    {
        /** @var JobRecommendation $jobRecommendation */
        $jobRecommendation = JobRecommendation::find($id);

        if (empty($jobRecommendation)) {
            Flash::error('Job Recommendation not found');

            return redirect(route('jobRecommendations.index'));
        }

        $jobRecommendation->fill($request->all());
        $jobRecommendation->save();

        Flash::success('Job Recommendation updated successfully.');

        return redirect(route('jobRecommendations.index'));
    }

    /**
     * Remove the specified JobRecommendation from storage.
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
            Flash::error('Job Recommendation not found');

            return redirect(route('jobRecommendations.index'));
        }

        $jobRecommendation->delete();

        Flash::success('Job Recommendation deleted successfully.');

        return redirect(route('jobRecommendations.index'));
    }
}

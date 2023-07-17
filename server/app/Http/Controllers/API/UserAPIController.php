<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateUserAPIRequest;
use App\Http\Requests\API\UpdateUserAPIRequest;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use Response;

/**
 * Class UserController
 * @package App\Http\Controllers\API
 */

class UserAPIController extends AppBaseController
{
    /**
     * Display a listing of the User.
     * GET|HEAD /users
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $query = User::query();

        if ($request->get('skip')) {
            $query->skip($request->get('skip'));
        }
        if ($request->get('limit')) {
            $query->limit($request->get('limit'));
        }

        $users = $query->get()->map( function ($user) {
            $user['interests'] = User::find($user->id)->interests;
            return $user;
        });

        return $this->sendResponse($users, 'Users retrieved successfully');
    }

    /**
     * Store a newly created User in storage.
     * POST /users
     *
     * @param CreateUserAPIRequest $request
     *
     * @return Response
     */
    public function store(CreateUserAPIRequest $request)
    {
        $input = $request->all();

        /** @var User $user */
        $user = User::create($input);
        $userArray = $user->toArray();
        $userArray['interests'] = $user->interests;
        return $this->sendResponse($userArray, 'User saved successfully');
    }

    /**
     * Display the current User.
     * GET|HEAD /users/me
     *
     * @return Response
     */
    public function profile()
    {
        $user = auth()->user();
        $userArray = $user->toArray();
        $userArray['interests'] = $user->interests;
        return $this->sendResponse($userArray, 'User retrieved successfully');
    }

    /**
     * Display the specified User.
     * GET|HEAD /users/{id}
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var User $user */
        $user = User::find($id);

        if (empty($user)) {
            return $this->sendError('User not found');
        }

        return $this->sendResponse($user->toArray(), 'User retrieved successfully');
    }

    /**
     * Update the specified User in storage.
     * PUT/PATCH /users/{id}
     *
     * @param int $id
     * @param UpdateUserAPIRequest $request
     *
     * @return Response
     */
    public function update(UpdateUserAPIRequest $request)
    {
        /** @var User $user */
        $user = auth()->user();

        if (empty($user)) {
            return $this->sendError('User not found');
        }

        $user->fill($request->all());
        $user->save();
        //check if interests exist in request
        if ($request->input('interests', [])) {
            //if yes, sync interests
            $user->interests()->sync($request->input('interests', []));
        }

        $userArray = $user->toArray();
        $userArray['interests'] = $user->interests;


        return $this->sendResponse($userArray, 'User updated successfully');
    }

    /**
     * Remove the specified User from storage.
     * DELETE /users/{id}
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var User $user */
        $user = User::find($id);

        if (empty($user)) {
            return $this->sendError('User not found');
        }

        $user->delete();

        return $this->sendSuccess('User deleted successfully');
    }

    /**
     * Update interests of the specified User in storage.
     */
    public function updateInterests(Request $request)
    {
        $user = auth()->user();
        $user->interests()->sync($request->input('interests', []) ?? []);
        $userArray = $user->toArray();
        $userArray['interests'] = $user->interests;
        return $this->sendResponse($userArray, 'User Interests updated successfully');
    }
}

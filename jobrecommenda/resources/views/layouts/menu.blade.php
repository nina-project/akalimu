<li class="nav-item">
    <a href="{{ url('/') }}"
       class="nav-link {{ Request::is('/') ? 'active' : '' }}">
        <p>Dashboard</p>
    </a>
</li>


<li class="nav-item">
    <a href="{{ route('jobs.index') }}"
       class="nav-link {{ Request::is('jobs*') ? 'active' : '' }}">
        <p>Jobs</p>
    </a>
</li>


<li class="nav-item">
    <a href="{{ route('users.index') }}"
       class="nav-link {{ Request::is('users*') ? 'active' : '' }}">
        <p>Users</p>
    </a>
</li>


<li class="nav-item">
    <a href="{{ route('jobRecommendations.index') }}"
       class="nav-link {{ Request::is('jobRecommendations*') ? 'active' : '' }}">
        <p>Job Recommendations</p>
    </a>
</li>


<li class="nav-item">
    <a href="{{ route('categories.index') }}"
       class="nav-link {{ Request::is('categories*') ? 'active' : '' }}">
        <p>Categories</p>
    </a>
</li>



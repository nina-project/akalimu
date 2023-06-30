<li class="nav-item">
    <a href="{{ url('/') }}"
       class="nav-link {{ Request::is('/') ? 'active' : '' }}">
       <i class="nav-icon fas fa-tachometer-alt"></i>
               <p>Dashboard</p>
    </a>
</li>


<li class="nav-item">
    <a href="{{ route('jobs.index') }}"
       class="nav-link {{ Request::is('jobs*') ? 'active' : '' }}">
       <i class="nav-icon fas fa-tools"></i>
        <p>Jobs</p>
    </a>
</li>


<li class="nav-item">
    <a href="{{ route('users.index') }}"
       class="nav-link {{ Request::is('users*') ? 'active' : '' }}">
       <i class="nav-icon fas fa-users"></i>
        <p>Users</p>
    </a>
</li>


<li class="nav-item">
    <a href="{{ route('jobRecommendations.index') }}"
       class="nav-link {{ Request::is('jobRecommendations*') ? 'active' : '' }}">
       <i class="nav-icon fas fa-thumbtack"></i>
        <p>Job Recommendations</p>
    </a>
</li>


<li class="nav-item">
    <a href="{{ route('categories.index') }}"
       class="nav-link {{ Request::is('categories*') ? 'active' : '' }}">
         <i class="nav-icon fas fa-list"></i>
        <p>Categories</p>
    </a>
</li>



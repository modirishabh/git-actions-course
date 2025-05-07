# gitactions


**6. **Control Job Execution****
**Control Job Execution:** Learn how to control job execution by setting up dependencies, outputs, and job concurrency.
**Run Jobs in Container**s: Understand how to run jobs within containers.
**Matrix Strategies**: Explore matrix strategies to run a job multiple times with different configurations.

**6.1 Explore job concurrency, outputs, and dependencies**
**Job Dependencies**: Jobs can be configured to run sequentially using the needs keyword, ensuring one job completes before another starts.
**Job Outputs**: Outputs allow data sharing between jobs, but are not meant for artifacts like binaries or reports.
**Concurrency Groups**: Concurrency groups ensure only one job or workflow in the group runs at a time, preventing resource contention and improving performance

**6.3 Run jobs within containers**
**Container Usage**: Running jobs within containers allows you to start with the necessary environment and tools, making the process faster and more efficient.
**Container Configuration**: You can specify the container image within the container map, and pull images from different container registries, including Docker Hub and GitHub Container Registry.
**Additional Settings**: You can configure settings like credentials for private registries, environment variables, ports, and mount volumes to enhance the container's functionality.

**6.4 Container Usage:** Running jobs within containers allows you to start with the necessary environment and tools, making the process faster and more efficient.
**Container Configuration**: You can specify the container image within the container map, and pull images from different container registries, including Docker Hub and GitHub Container Registry.
**Container Usage:** Running jobs within containers allows you to start with the necessary environment and tools, making the process faster and more efficient.
**Container Configuration**: You can specify the container image within the container map, and pull images from different container registries, including Docker Hub and GitHub Container Registry.
**Additional Setting**s: You can configure settings like credentials for private registries, environment variables, ports, and mount volumes to enhance the container's functionality.

**6.4 Control job execution**
**Job Dependencies**: Use the needs keyword to ensure that certain jobs run only after others have completed.
**Job Outputs**: Define and use output variables to share data between jobs.
**Concurrency Groups:** Manage job execution order within concurrency groups to prevent multiple jobs from running simultaneously when they share resources.

**6.5 Explore matrix strategie**
**Matrix Strategies**: Allows you to run a job with different variations such as environment, runtime, tools, and configurations, which is useful for testing and building on diverse platforms.
**Configuration**: Define a strategy map and within it, a matrix map with variables to create different job combinations. Use the include and exclude lists to manage these combinations.
**Strategy Settings**: Customize matrix job behavior with settings like fail-fast to cancel jobs on failure and max-parallel to define the number of jobs running simultaneously.

**6.6 Implement matrix strategie**
**Creating a Repository**: Set up a new repository with a README file and create a workflow file in the .github/workflows/ directory.
**Defining Matrix Strategy**: Configure the matrix strategy with different runners (e.g., ubuntu-latest, windows-latest, macos-latest) and Python versions (e.g., 3.11, 3.12, 3.13).
**Include and Exclude Configuration**s: Use include to add specific configurations and exclude to remove certain combinations from the matrix.
**Job Execution**: Define steps to run the job, specifying the runner and Python version from the matrix context, and execute the workflow to see the different job combinations.

**7 Integrate GitHub Actions, Create Custom Actions, Optimize Workflows**
**Integrate GitHub Actions**: Learn how to explore and integrate GitHub Actions into your workflows.
**Create Custom Actions**: Understand how to create custom actions, including composite, JavaScript, and Docker container actions.
**Optimize Workflows**: Learn about artifacts and cache to optimize your workflows, and practice sharing data between jobs using artifacts.

**7.1 Understand actions in GitHub Actions**

**Types of Actions**: GitHub Actions can be custom actions created by you or actions shared by the GitHub community. These include Composite, JavaScript, and Docker container actions.
**Usage**: Actions are used within workflows using the uses keyword, specifying the owner, repository, and version (tag, hash, or branch).
**Parameters**: Customize actions with parameters using the with keyword, and for Docker container actions, use the args keyword to pass arguments.

**7.2 Discover and use actions in GitHub Actions**
Creating a Repository: The video demonstrates how to create a new public repository, including adding a README file, a .gitignore file, and a license.
Setting Up a Workflow File: It explains how to create a workflow file in the .github/workflows directory, specifying the event trigger and job details.
Using Actions: The video shows how to add actions to your workflow from the GitHub Marketplace, including the checkout action, and how to configure its parameters.

**7.3 Learn about artifacts and cache**
**Artifacts**: Used to store files produced by your jobs, such as logs, executables, and reports. They are retained for 90 days by default but can be customized.
**Cache**: Ideal for storing files that don't change often, like packages and dependencies. This helps speed up workflow runs by skipping the download step. The cache size is limited to 10GB and entries not accessed in over seven days are automatically removed.
**Management**: Both artifacts and cache can be managed via the GitHub web interface, REST API, and GitHub CLI.

**7.4 Share data between jobs with artifacts_LAB**
**Creating a Repository and Workflow**: Set up a new repository and create a workflow file named artifacts.yml in the .github/workflows/ directory.
**Uploading Artifacts**: Define a job to generate and upload an artifact (e.g., myArtifact.txt) using the upload-artifact GitHub Action.
**Downloading Artifacts**: Define another job to download the previously uploaded artifact using the download-artifact GitHub Action, ensuring job dependencies are correctly set with the needs keyword.

**7.5** **Optimize your workflow with cache-LAB**
**Creating a Repository**: You start by creating a new public repository and adding a README file.
**Setting Up Requirements**: Create a requirements.txt file to list the libraries needed for your project.
**Creating a Workflow File**: Set up a workflow file (cache.yml) with the necessary components like event triggers and job sections.
**Using Cache Action**: Implement the cache action to store and retrieve dependencies, optimizing the workflow by reducing the need to download dependencies repeatedly.

**7.6 Explore the metadata file and composite actions, part 1**
**Composite Actions**: These bundle several workflow steps into a single reusable action, making workflows more modular and easier to manage.
**Metadata File (action.yaml)**: This file defines the action's inputs, outputs, and configuration. Key sections include:
**Inputs**: Optional parameters passed to the action, with default values and descriptions.
**Outputs**: Optional data produced by the action, identified by an ID and description.
**Runs Section**: Specifies the type of action (composite in this case) and includes the steps to be executed.

**7.7 Explore the metadata file and composite actions, part 2**
**Creating a Composite Action**: The video demonstrates how to create a composite action by setting up a new repository and adding an action.yml file at the root level.
**Defining Metadata**: It covers defining the main components of the metadata file, including inputs, outputs, and steps for the composite action.
**Testing the Composite Action**: The video shows how to create a workflow file to test the composite action, ensuring it runs correctly and outputs the expected results.

**7.8 Learn custom JavaScript action**
**Creating JavaScript Actions**: To create a JavaScript GitHub action, you need Node.js installed on your system. You will also need to install the core and GitHub packages from the actions toolkit to interact with GitHub Actions context and workflow commands.
**Metadata File**: The metadata file for JavaScript actions includes inputs, outputs, and the runs section, where you specify the runtime and the JavaScript file to execute.
**Using Vercel NCC**: This package is useful for compiling Node.js modules into a single file, simplifying the process by avoiding the need to upload the entire node_modules directory.

**7.9 Create a JavaScript action**
**Repository Setup**: Create a new repository with a README and a .gitignore file for Node.js. Install Node.js and VS Code.
**Initialize Project**: Clone the repository, initialize it with npm init -y, and create an action.yml file with necessary metadata.
**Install Packages**: Install required packages using npm install @actions/core @actions/github and npm install -g @vercel/ncc.
**Create Action**: Write the index.js file to define the action, including importing necessary packages, handling inputs, and defining outputs.
**Compile and Commit**: Compile the index.js file using ncc build, update the .gitignore file, and commit the changes to the repository.
**Test Action**: Create a workflow file to test the action by defining a job that uses the action and verifies its output.

**7.10 Examine custom Docker container actions**
**Docker Container Action**: This type of GitHub action builds an image from your Dockerfile, specifying the operating system, tools, and dependencies needed for your task.
**Metadata File Configuration**: You need a metadata file to configure inputs, outputs, and action settings. The using key must be set to Docker, and you can specify environment variables, arguments, entry points, and pre/post-entry points.
**File Acces**s: Outputs can be accessed through the GitHub output environment file, and files generated in the container can be accessed via the GitHub/workspace path.
**Dockerfile Requirements**: The Dockerfile name must start with a capital "D," and the first instruction should be the FROM instruction.

**7.11 "Create Docker container actions**
**Repository Setup**: Create a new public repository with a README file and add an entrypoint.sh script to handle inputs and outputs.
**Dockerfile Creation**: Add a Dockerfile specifying the base image (e.g., alpine:3.10), copy the entrypoint.sh script into the container, and set the entry point.
**Metadata and Workflow**: Create an action.yml metadata file to define inputs, outputs, and Docker settings. Then, add a workflow file to test the Docker action by running it on a GitHub runner.

**8 Continuous Integration **
**Continuous Integration (CI)**: This is a process where you regularly test your code to make sure it works correctly. Think of it as a way to catch mistakes early.
**Unit Testing and Code Coverage**: These are methods to check if small parts of your code work as expected and how much of your code is tested.
**Code Scanning**: This helps find errors and security issues in your code automatically.
**Dependabot and Secret Scanning**: Dependabot helps keep your code's dependencies up to date, and secret scanning checks for sensitive information in your code.
**Code Owners and Branch Protection**: These features help manage who is responsible for different parts of the code and protect important parts of your code from unwanted changes.

**8.1 Set up unit testing and code coverage, part 1**
**Unit Testing**: Helps ensure that individual units of code function correctly by catching bugs early. It involves writing test cases to verify that the code produces the expected results.
**Code Coverage:** Measures how much of your code is tested. It tracks lines, branches, and functions that have tests, helping identify untested areas that might contain bugs.
**Tools**: Various tools are available for unit testing and code coverage, depending on the programming language (e.g., JavaScript, Python, Java).

**8.2 Set up unit testing and code coverage, part 2**
**Create a Repository**: Go to GitHub, create a new public repository with a README file and a .gitignore file for Node.js.
**Clone the Repository:** Copy the repository URL and clone it using Visual Studio Code.
**Set Up the Project**: Open the terminal in VS Code and initialize the project with npm init -y.
                    Install Jest for unit testing with npm install --save-dev jest.
**Write Code and Tests:**
Create a folder named src and add a file appOperations.js with a function to multiply two numbers.
Create a __tests__ folder with a file appOperations.test.js to write test cases for your function.
**Run Tests**: Configure Jest in package.json and run npm test to execute the tests.
**Add Code Coverage**: Add the --coverage flag to the test command to generate a code coverage report.
**Automate with GitHub Actions**: Create a .github/workflows directory with a YAML file to define a workflow for running tests and generating code coverage reports automatically on pull requests.
**Enhance Workflow**: Use a GitHub Action to publish the code coverage report to pull requests and set a coverage threshold.

**8.3 Code Scanning **
**Purpose**: Code scanning helps identify security vulnerabilities and coding errors in your GitHub repository. This ensures your code is secure and of high quality.

**How It Works**
Queries and CodeQL: Code scanning uses queries to detect specific vulnerabilities. CodeQL is the tool that generates a database representing your codebase and runs these queries.
Custom Queries: You can use pre-written queries by GitHub experts or write your own to tailor the scanning to your needs.

**Setting Up Code Scanning**
**Enabling Feature**: You need to enable code scanning in the repository settings.
**Default Setup:** By default, code scanning runs on each push to the default branch, on pull requests, and on a weekly schedule.
**Advanced Setup**: For more customization, you can configure advanced settings or run CodeQL CLI in an external CI system and upload results to GitHub.

**Alerts and Visualization**
Alerts: When a vulnerability or error is found, an alert is created.
Security Tab: You can view these alerts in the Security tab of your GitHub repository.

**Supported Languages**
Languages: CodeQL supports several languages, including C, C++, C#, Go, Java, JavaScript, Python, Ruby, and Swift.

**Practical Application**
Integration: You can integrate third-party code scanning tools within GitHub Actions or external CI systems, making it flexible and adaptable to your workflow.

**8.4 Dependabot**

**Purpose**: Dependabot helps keep your code's dependencies (libraries and packages your code relies on) up to date, ensuring your code is secure and runs smoothly.
**How It Works:**
Dependabot scans your repository for outdated dependencies.
It creates pull requests to update these dependencies automatically.
You can configure it using a dependabot.yml file to specify settings like the package manager, update schedule, and reviewers
**Security Updates:**
Version Updates: Keeps all dependencies up to date, even if there are no known vulnerabilities.
Security Updates: Specifically targets dependencies with known vulnerabilities and updates them to secure versions.

**8.5 Secret Scanning**
**Purpose**: Secret scanning identifies sensitive information (like API keys, tokens, and private keys) that might have been accidentally committed to your repository.
**How It Works:**
It scans the entire Git history, including branches, issues, pull requests, and discussions.
When it finds patterns matching known secrets, it creates alerts in the Security tab of your repository.

**8.6 CODEOWNERS File**
**Purpose**: The CODEOWNERS file is used to define the users or teams responsible for specific sections of code in your repository. This ensures that the right people review changes made to the code, improving code quality and accountability.
**File Location**: The CODEOWNERS file can be placed in one of the following directories in your repository: 
1)Root directory
2).github directory
3)docs directory

**Structure and Rules**
**File Naming**: The file must be named CODEOWNERS in capital letters.
**Ownership Rules**: Each line in the CODEOWNERS file specifies a file path or pattern followed by one or more owners.
**Example Patterns:**
/ - The user repo-owner is the default owner of everything in the repository.
/scripts/ - The users scripts-owner and anotheruser@email.com are the owners of any file in the scripts directory.
/apps/* - The user someuser is the owner of all files in the apps directory, but not its subdirectories.
*.js - The user js-owner is the owner of all JavaScript files in the repository.
logs/ - The user log-owner is the owner of any directory named logs throughout the whole repository.

**Precedence of Rules**
If multiple patterns match a file or directory, the last one in the CODEOWNERS file takes precedence.

**Permissions**
Users or teams added to these rules must have explicit write access to the repository.

**Set up code owners**
1) Create a New Branch: Start by creating a new branch named add-codeowners in your repository.
2) Add CODEOWNERS File: Create a CODEOWNERS file at the root of the repository and define the ownership rules, such as assigning the front-end-team to review changes to the CSS folder.
3) Commit and Push Changes: Commit the changes, push the branch to GitHub, and create a pull request.
4) Review and Merge: Review the pull request, ensure the correct users or teams have write access, and merge the changes.


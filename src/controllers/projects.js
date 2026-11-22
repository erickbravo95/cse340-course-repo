
import {
    getUpcomingProjects,
    getProjectDetails
} from '../models/projects.js';

import {
    getCategoriesByProjectId
} from '../models/categories.js';

const NUMBER_OF_UPCOMING_PROJECTS = 5;

// Display upcoming projects
const showProjectsPage = async (req, res) => {
    const projects = await getUpcomingProjects(NUMBER_OF_UPCOMING_PROJECTS);
    const title = 'Upcoming Service Projects';

    res.render('projects', { title, projects });
};

// Display project details
const showProjectDetailsPage = async (req, res, next) => {
    try {
        const id = req.params.id;
        const project = await getProjectDetails(id);

        if (!project) {
            return res.status(404).render('errors/404', {
                title: 'Project Not Found'
            });
        }

        const categories = await getCategoriesByProjectId(id);
        const title = project.title;

        res.render('project', {
            title,
            project,
            categories
        });
    } catch (error) {
        next(error);
    }
};

// Export controller functions
export {
    showProjectsPage,
    showProjectDetailsPage
};

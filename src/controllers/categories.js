
import {
  getAllCategories,
  getCategoryById,
  getProjectsByCategoryId
} from '../models/categories.js';

// Display all categories
const showCategoriesPage = async (req, res) => {
  const categories = await getAllCategories();
  const title = 'Service Categories';

  res.render('categories', { title, categories });
};

// Display a single category and its projects
const showCategoryDetailsPage = async (req, res, next) => {
  try {
    const categoryId = req.params.id;

    const category = await getCategoryById(categoryId);

    if (!category) {
        return res.status(404).render('errors/404', {
            title: 'Category Not Found'
        });
    }

    const projects = await getProjectsByCategoryId(categoryId);

    const title = category.name;

    res.render('category', {
      title,
      category,
      projects
    });
  } catch (error) {
    next(error);
  }
};

// Export controller functions
export {
  showCategoriesPage,
  showCategoryDetailsPage
};

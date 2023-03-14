<?php 
require_once('src/lib/database.php');
require_once('src/model/recipes.php');
require_once('src/model/ingredients.php');
require_once('src/model/varManager.php');

use test\Ingredients; 
use App\Model\varManager;


function homepage() 
{
   

    require('templates/homepage.php');
}
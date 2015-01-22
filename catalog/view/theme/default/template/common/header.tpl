<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<!--<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />-->
<link href="http://bootswatch.com/paper/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<div id="top-section">
<nav id="top">
  <div class="container">
    
    <!----
    <div id="top-links" class="nav pull-left top-menu">
        <a href="#"></i> Ladies Fashion</a>
        <a href="#"></i> Perfumes </a>
        <a href="#"></i> Facebook Page</a>
    </div>-->

    <div class="continer">
      <div class="row">
        <div class="col-sm-3">
          <div id="logo" >
          <?php if ($logo) { ?>
            <a href="<?php echo $home; ?>"><img style="margin-top:-3px;" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
          </div>
        </div>
        <div class="col-sm-4">
          <?php echo $search; ?>
        </div>  
        <div class="col-sm-2">
          <?php echo $cart; ?>
        </div>
        <div class="col-sm-3">
          <div class="nav pull-right top-menu">
            <ul class="list-inline">
            <li class="dropdown lvl1 dropdown-toggle"><a href="#" data-toggle="dropdown"><span class="hidden-xs hidden-sm hidden-md">Help ?</a>
              <ul class="dropdown-menu dropdown-menu-left" style="margin-left:-50px;">
                <li class="lvl2"><a href="#">FAQ</a></li>
                <li class="lvl2"><a href="#">Dilivery & Payment</a></li>
                <li class="divider"></li>
                <li style="text-align:center;"><i class="fa fa-phone"></i> <span> Ph:<?php echo $telephone; ?></span></li>
              </ul>
            </li>
            <?php if (!$logged) : ?>
              <li class="lvl1"><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li> &nbsp;
              <li class="lvl1"><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li> 
            <?php else : ?>
              <li class="lvl1"><a href="#"><i class="fa fa-truck"></i> My Orders</a></li>
              <li class="dropdown lvl1 dropdown-toggle"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li class="lvl2"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                  <li class="lvl2"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                  <li class="lvl2"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                </ul>
              </li>
            <?php endif; ?>
            </ul>
          </div>
        </div>
      </div>
    </div>

    </div>
    

        <!----<li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>-->
        <!----<li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li> -->
            <!----<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>-->
            <!---- <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-money"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
        -->
</nav>
<!----
<header id="head-section">
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
-->
<!--
<?php if ($categories) { ?>
<div class="cat1_wrapper">
<div class="container">
  <nav class="navbar cat1_menu" id="menu">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"><?php echo $category['name']; ?></a>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
</div>
-->
<!----
    <?php
      //#TODO:: Only work with query based url. need to think for segment based url
      if(array_key_exists("path",$_GET)){
    		$root_cat = substr($_GET["path"],0,2);
    		if($root_cat == '59'){
    		  $cat1 = $categories[0];
    		}
    		else if ($root_cat == '60'){
    		  $cat1 = $categories[1];
    		}
    		else if ($root_cat == '61'){
    		  $cat1 = $categories[2];
  		  } else {
  			  $cat1 = null;
  		  }
	    } else {
        $cat1 = $categories[0];
      }
    ?>

    <?php if (isset($cat1) && $cat1['children']) { ?>
    <nav class="navbar cat2_wrapper">
    <ul class="nav navbar-nav cat2_menu">
        <?php foreach ($cat1['children'] as $cat2) { ?>
        <?php if(isset($cat2['children']) && sizeof($cat2['children']) > 0) : ?>
            <li class="dropdown">
                <a href="<?php echo $cat2['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $cat2['name']; ?> <b class="caret"></b> </a>
                <?php if (sizeof($cat2['children']) > 0) : ?>
                    <ul class="dropdown-menu"">
                    <?php foreach($cat2['children'] as $cat3) : ?>
                        <li><a href="<?php echo $cat3['href']; ?>"><?php echo $cat3['name']; ?></a></li>
                    <?php endforeach; ?>
                    </ul>
                <?php endif; ?>
            </li>
        <?php else : ?>
            <li><a href="<?php echo $cat2['href']; ?>"><?php echo $cat2['name']; ?></a></li>
        <?php endif; ?>
        <?php } ?>
    </ul>
    </nav>
    <?php } ?>
-->
  <div class="categories-wrapper">
    <div class="container">
    <?php if (isset($promoted_categories)) { ?>
      <nav class="cat2_wrapper">
      <ul class="nav navbar-nav cat2_menu">
          <?php foreach ($promoted_categories as $cat2) { ?>
          <?php if(isset($cat2['children']) && sizeof($cat2['children']) > 0) : ?>
              <li class="dropdown">
                  <a href="<?php echo $cat2['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $cat2['name']; ?> <b class="caret"></b> </a>
                  <?php if (sizeof($cat2['children']) > 0) : ?>
                      <ul class="dropdown-menu">
                      <?php foreach($cat2['children'] as $cat3) : ?>
                          <li><a href="<?php echo $cat3['href']; ?>"><?php echo $cat3['name']; ?></a></li>
                      <?php endforeach; ?>
                      </ul>
                  <?php endif; ?>
              </li>
          <?php else : ?>
              <li><a href="<?php echo $cat2['href']; ?>"><?php echo $cat2['name']; ?></a></li>
          <?php endif; ?>
          <?php } ?>

          <li class="dropdown pull-right">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Popular Brands <b class="caret"></b> </a>
            <ul class="dropdown-menu manufacturers-menu">
            <?php foreach($manufacturers as $manufacturer) : ?>
                <li><a class="menu-item" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></li>
            <?php endforeach; ?>
            <li class="divider"></li>
            <li><a class="menu-more-items" href="<?php echo $link_manufacturer; ?>">All Brands</a></li>
            </ul>
          </li>
      </ul>
      </nav>
    <?php } ?>    
    </div>  
  </div>

</div>
<?php } ?>


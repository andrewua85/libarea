<?php include TEMPLATE_DIR . '/header.php'; ?>
    <div class="wrap">

        <?php if (!$data['uid'] > 0) { ?>
            <h1 class="top banner">Сайт в стадии разработке. Читать - <a href="/info/about">о нас</a>...</h1> 
        <?php } ?>    
    
        <div class="telo">
            <?php if (!empty($data['posts'])) { ?>
          
                <?php foreach ($data['posts'] as  $post) { ?>
                    <div class="post-telo">
                    
                        <div id="vot<?= $post['post_id']; ?>" class="voters">
                            <div data-id="<?= $post['post_id']; ?>" class="post-up-id"></div>
                            <div class="score"><?= $post['post_votes']; ?></div>
                        </div>
                        <div class="post-body">
                            <a class="u-url" href="/posts/<?= $post['post_slug']; ?>">
                                <h2 class="titl"><?= $post['post_title']; ?></h2>
                            </a>
                       
                            <a class="space space_<?= $post['space_tip'] ?>" href="/s/<?= $post['space_slug']; ?>" title="<?= $post['space_name']; ?>">
                                <?= $post['space_name']; ?>
                            </a>
                            
                            <div class="footer">
                                <img class="ava" alt="<?= $post['login']; ?>" src="/images/user/small/<?= $post['avatar']; ?>">
                                <span class="user"> 
                                    <a href="/u/<?= $post['login']; ?>">
                                        <?= $post['login']; ?>
                                    </a> 
                                </span>
                                <span class="date"> 
                                   <?= $post['date'] ?>
                                </span>
                                <?php if($post['num_comments'] !=0) { ?> 
                                    <span class="otst"> | </span>
                                    <a class="u-url" href="/posts/<?= $post['post_slug']; ?>">
                                       <?= $post['num_comments']; ?>  <?= $post['post_comments']; ?>  
                                    </a>
                                <?php } ?>
                            </div>
                        </div>                        
                    </div>
                <?php } ?>
                
            <?php } else { ?>

                <h3>Нет постов</h3>

                <p>К сожалению постов нет...</p>

            <?php } ?>
        </div>
       
        <?php if($data['space_hide']) { ?>
            <div class="sidebar no-mob">
                <h3>Отписан</h3>  
                <?php foreach ($data['space_hide'] as  $hide) { ?>
                    <a class="space space_<?= $hide['space_tip'] ?>" href="/s/<?= $hide['space_slug']; ?>" title="<?= $hide['space_name']; ?>">
                        <?= $hide['space_name']; ?>
                    </a>
                <?php } ?>
            </div>
        <?php } ?>
       
        <?php if($data['latest_comments']) { ?>
            <div class="sidebar no-mob">
                <?php foreach ($data['latest_comments'] as  $comm) { ?>
                    <div class="sb-telo">
                        <div class="sb-date"> 
                            <img class="ava" alt="<?= $comm['login']; ?>" src="/images/user/small/<?= $comm['comment_avatar']; ?>">
                            <?= $comm['comment_date']; ?>
                        </div> 
                        <a href="/posts/<?= $comm['post_slug']; ?>#comm_<?= $comm['comment_id']; ?>">
                            <?= $comm['comment_content']; ?>...  
                        </a>
                   </div>
                <?php } ?>
            </div>
        <?php } ?>
        
        <div class="pagination">
            <?php for ($pageNum = 1; $pageNum <= $data['pagesCount']; $pageNum++) { ?>
                <?php if ($data['pNum'] == $pageNum || !$data['pNum'] == 1) { ?>
                    <span class="page"><?= $pageNum; ?></span>
                <?php } else { ?>
                    <a href="/<?= $pageNum == 1 ? '' : $pageNum ?>"><?= $pageNum; ?></a>
                <?php } ?>
            <?php } ?>
        </div>
        
    </div>

<?php include TEMPLATE_DIR . '/footer.php'; ?>
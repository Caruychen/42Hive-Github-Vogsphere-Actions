# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    deploy_vogsphere.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cchen <cchen@student.hive.fi>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/01 13:56:45 by cchen             #+#    #+#              #
#    Updated: 2021/11/02 13:32:37 by cchen            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# This shell file will be executed in the github actions envrionment when you push.
# Below is an example based on the libft project folder requirements. 

# $REPO_NAME will be replaced by the name of your Github repository on runtime
# intra-uuid-* is the name of the target repository that is created when it gets cloned
# note that it contains the wildcard (*) since the repo ID is renewed each time you fail.
# the intra-uuid-* folder is essentially the root of the vogsphere repository.
# This is where you will place all of the logic of how you want to move your work from
# your personal repository into the project repository on vogsphere.

cp ./$REPO_NAME/author ./intra-uuid-*
cp ./$REPO_NAME/Makefile ./intra-uuid-*
cp ./$REPO_NAME/srcs/* ./intra-uuid-*
cp ./$REPO_NAME/includes/* ./intra-uuid-*

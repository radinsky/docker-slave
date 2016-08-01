# The MIT License
#
#  Copyright (c) 2015, CloudBees, Inc.
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.

FROM java:8-jdk

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/2.52/remoting-2.52.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

ENV HOME /home/jenkins
RUN groupadd -g 10000 jenkins
RUN useradd -c "Jenkins user" -d $HOME -u 10000 -g 10000 -m jenkins

WORKDIR $HOME
USER jenkins

RUN mkdir /home/jenkins/.tmp
RUN ssh-keygen -q -t rsa -N '' -f /home/jenkins/.ssh/id_rsa
RUN touch /home/jenkins/.ssh/known_hosts
RUN echo '1|RF7sz8j4g7eE3uN7Q1IJGluu14E=|nx1VqLW+XQ04U3zvnHk9Woc6S4g= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA03KF6OTPkOjnKujD9yZq25eEroNrrKJlBSZIqr0jc1fz8sE+bTFCcNK6FCCR/SuoKBKgLO0z4DKBKDvnie5+8Z/YFqw5WOA0f/Xpbjv7hFjGrBtQnNfy9L8rnnzQ2q5DKxHmgvVb7ReJPR3coPlLUceUu8iPMlpU/4C7A0Z5Qu7HgkPT0hna1rFeQ6oofoLefZ8Nwacai/Fkbq9r4rah4lHs3HDpNxbHZ1A+pmBejXEt/12FfbzsnGzpp4L6cY61NnW1UGtVqSqLxh6b3bIh1dz+UZB1PiYVX5g4TiVPPLLn7TC0BWjCuf+P8f/Or9t+WT7E0+/jhDlZZnJyZ35TWQ==
|1|42N9d8pWFRjopjP82EodggTUuVg=|4KLg+GRnzlYOUGzp0LuDj7FJQrw= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA03KF6OTPkOjnKujD9yZq25eEroNrrKJlBSZIqr0jc1fz8sE+bTFCcNK6FCCR/SuoKBKgLO0z4DKBKDvnie5+8Z/YFqw5WOA0f/Xpbjv7hFjGrBtQnNfy9L8rnnzQ2q5DKxHmgvVb7ReJPR3coPlLUceUu8iPMlpU/4C7A0Z5Qu7HgkPT0hna1rFeQ6oofoLefZ8Nwacai/Fkbq9r4rah4lHs3HDpNxbHZ1A+pmBejXEt/12FfbzsnGzpp4L6cY61NnW1UGtVqSqLxh6b3bIh1dz+UZB1PiYVX5g4TiVPPLLn7TC0BWjCuf+P8f/Or9t+WT7E0+/jhDlZZnJyZ35TWQ==' > /home/jenkins/.ssh/known_hosts

VOLUME ["/home/jenkins"]

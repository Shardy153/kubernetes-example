#!/usr/bin/sh

install()
{
  cd dev
  echo "Creating dev environment...!!"
  kubectl create -f deploy-dev.yaml
  echo "Sleeping for 5 seconds...!!\n"
  sleep 5

  cd ../test
  echo "Creating test environment...!!"
  kubectl create -f deploy-test.yaml
  echo "Sleeping for 5 seconds...!!\n"
  sleep 5

  cd ../staging
  echo "Creating staging environment...!!"
  kubectl create -f deploy-staging.yaml
  echo "Sleeping for 5 seconds...!!\n"
  sleep 5
}

uninstall()
{
  cd dev
  echo "Deleting dev environment along with its resources"
  kubectl delete -f deploy-dev.yaml

  cd ../test
  echo "Deleting test environment along with its resources"
  kubectl delete -f deploy-test.yaml

  cd ../staging
  echo "Deleting staging environment along with its resources"
  kubectl delete -f deploy-staging.yaml
}


if [ $# -eq 0 ]
then
        echo "Missing options!"
        echo "(run $0 -h for help)"
        echo ""
        exit 0
fi

while getopts "cdh" OPTION; do
        case $OPTION in
                c)
                        install
                        ;;
                d)
                        uninstall
                        ;;
                h)
                        echo "Usage:"
                        echo "args.sh -h for help"
                        echo "args.sh -c for Creating resources"
                        echo "args.sh -d for Deleting resources"
                        echo ""
                        echo "   -h   help (this output)"
                        exit 0
                        ;;

        esac
done

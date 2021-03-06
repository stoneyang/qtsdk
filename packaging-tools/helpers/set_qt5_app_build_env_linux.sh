#!/bin/bash
#############################################################################
##
## Copyright (C) 2014 Digia Plc and/or its subsidiary(-ies).
## Contact: http://www.qt-project.org/legal
##
## This file is part of the release tools of the Qt Toolkit.
##
## $QT_BEGIN_LICENSE:LGPL$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and Digia.  For licensing terms and
## conditions see http://qt.digia.com/licensing.  For further information
## use the contact form at http://qt.digia.com/contact-us.
##
## GNU Lesser General Public License Usage
## Alternatively, this file may be used under the terms of the GNU Lesser
## General Public License version 2.1 as published by the Free Software
## Foundation and appearing in the file LICENSE.LGPL included in the
## packaging of this file.  Please review the following information to
## ensure the GNU Lesser General Public License version 2.1 requirements
## will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
##
## In addition, as a special exception, Digia gives you certain additional
## rights.  These rights are described in the Digia Qt LGPL Exception
## version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
##
## GNU General Public License Usage
## Alternatively, this file may be used under the terms of the GNU
## General Public License version 3.0 as published by the Free Software
## Foundation and appearing in the file LICENSE.GPL included in the
## packaging of this file.  Please review the following information to
## ensure the GNU General Public License version 3.0 requirements will be
## met: http://www.gnu.org/copyleft/gpl.html.
##
##
## $QT_END_LICENSE$
##
#############################################################################

E_BADARGS=65

if [ -z "$1" ]; then
  echo "Usage: $0 <license> <qt version> <package storage base url>"
  exit $E_BADARGS
else
  LICENSE=$1
fi

if [ -z "$2" ]; then
  echo "Usage: $0 <license> <qt version> <package storage base url>"
  exit $E_BADARGS
else
  QT_VERSION=$2
fi

if [ -z "$3" ]; then
  echo "Usage: $0 <license> <qt version> <package storage base url>"
  exit $E_BADARGS
else
  PACKAGE_STORAGE_BASE_URL=$3
fi

export QT5_LIB_PATH_HTTP=$PACKAGE_STORAGE_BASE_URL/$LICENSE/qt/$QT_VERSION/latest

if [[ "$cfg" == *"_QNX-"* ]]; then
    . /opt/qnx660/qnx660-env.sh
fi

if [[ "$cfg" == *"_QNX650-"* ]]; then
    . /opt/qnx650/qnx650-env.sh
fi

echo "Set build env for Qt5 Application builds"
echo "License: $LICENSE"
echo "Qt version: $QT_VERSION"
echo "Package storage base url: $PACKAGE_STORAGE_BASE_URL"
echo "Qt5 lib path http: $QT5_LIB_PATH_HTTP"


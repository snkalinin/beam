# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os

from helper import find_examples, Example


class CDHelper:
    """ Helper for CD step.

    It is used to save beam examples/katas/tests and their output on the Google Cloud.
    """

    def save_to_cloud(self):
        """ Save beam examples and their output in the Google Cloud.
        """
        root_dir = os.getenv("BEAM_ROOT_DIR")
        examples = find_examples(root_dir)
        self._run_code_all_examples(examples)
        self._save_to_cloud_all_examples(examples)

    def _run_code_all_examples(self, examples: [Example]):
        """ Run beam examples and keep their ouput.

        Call the backend to start code processing for the examples. Then receive code output.

        Args:
            examples: beam examples that should be run
        """
        for example in examples:
            # TODO [BEAM-13258] Implement logic of calling backend to run example's code
            output = ""
            example.output = output

    def _save_to_cloud_all_examples(self, examples: [Example]):
        """ Save beam examples and their output using backend instance.

        Args:
            examples: beam examples with their output
        """
        # TODO [BEAM-13258] Implement logic of saving examples
        pass

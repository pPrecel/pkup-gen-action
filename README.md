#

``` text
.______    __  ___  __    __  .______
|   _  \  |  |/  / |  |  |  | |   _  \
|  |_)  | |  '  /  |  |  |  | |  |_)  |__ _  ___ _ __
|   ___/  |    <   |  |  |  | |   ___// _' |/ _ \ '_ \
|  |      |  .  \  |  '--'  | |  |   | (_| |  __/ | | |
| _|      |__|\__\  \______/  | _|    \__, |\___|_| |_|action
                                      |___/
```

---

Easy-to-use action allows generating PKUP reports and sending them zipped using the most popular email servers.

## Configuration

Action requires the `.pkupcompose.yaml` file located in the repository root directory and can be configured by passing additional (not required) inputs.

### Inputs

* `generate` (default: `treu`) - if true use the `.pkupcompose.yaml` file to generate reports
* `create-tag` (default: `true`) - if true create branch and tag, named in format `<MONTH>.<YEAR>` with generated reports
* `send-emails` (default: `true`) - if true send emails to reports owners described in the `.pkupcompose.yaml` file (under the `.reports[].email` fields)
* `since` (default: 19th day of past month) - timestamp used to generate reports - foramt 02.01.2006
* `until` (default: 18th day of actual month) - timestamp used to generate reports - foramt 02.01.2006

### .pkupcompose.yaml

The action uses the `.pkupcompose.yaml` file documented [here](https://github.com/pPrecel/pkup-gen/tree/main/examples/compose-and-send).

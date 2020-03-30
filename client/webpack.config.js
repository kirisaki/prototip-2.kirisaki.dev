const path = require("path")
const HtmlWebpackPlugin = require("html-webpack-plugin")

module.exports = {
  output: {
    path: path.join(__dirname, '/dist')
  },
  resolve: {
    extensions: [".ts", ".tsx", ".js", ".jsx"]
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        loader: "ts-loader",
        options: {
          transpileOnly: true
        }
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.join(__dirname, "src/index.html")
    })
  ],
}

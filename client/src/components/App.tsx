import * as React from 'react'
import {} from 'react'
import { 
  BrowserRouter as Router,
  Switch,
  Route,
} from 'react-router-dom'

import { Navigation } from './Navigation'
import { Index } from './Index'
import { About } from './About'
import { Dashboard } from './Dashboard'

import styles from './style.css'

export const App: React.FC = () => {
  return (
    <Router>
      <div>
        <Navigation />
        <hr />
        <Switch>
          <Route exact path = "/">
            <Index />
          </Route>
          <Route path = "/about">
            <About />
          </Route>
          <Route path = "/dashboard">
            <Dashboard />
          </Route>
        </Switch>
      </div>
    </Router>
  )
}

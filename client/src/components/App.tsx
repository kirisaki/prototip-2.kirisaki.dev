import React, { Suspense, lazy } from 'react'
import {} from 'react'
import { 
  BrowserRouter as Router,
  Switch,
  Route,
} from 'react-router-dom'

import { Navigation } from './Navigation'
const Index = lazy(() => import('./Index'))
const About = lazy(() => import('./About'))
const Dashboard = lazy(() => import('./Dashboard'))
const Notfound = lazy(() => import('./Notfound'))

import styles from './style.css'

export const App: React.FC = () => {
  return (
    <Router>
      <div>
        <Navigation />
        <hr />
        <Suspense fallback={<div>loading...</div>}>
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
            <Route path = "*">
              <Notfound />
            </Route>
          </Switch>
        </Suspense>
      </div>
    </Router>
  )
}

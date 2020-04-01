import * as React from 'react'
import { useEffect } from 'react'

export const Dashboard: React.FC = () => {
  useEffect(() => {
    document.title = 'prototip-2 - dashboard'
  })
  return(
    <div>
      dashboard dayo
    </div>
  )
}



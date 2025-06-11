import "@typespec/http";
import "@typespec/openapi3";
import "@microsoft/typespec-m365-copilot";
import "./actions.tsp";

using TypeSpec.Http;
using TypeSpec.M365.Copilot.Agents;
using TypeSpec.M365.Copilot.Actions;

@agent(
  "M365RepairServiceAgent",
  "An agent for managing repair information."
)

@instructions("""
You will assist the user in finding car repair records based on the information provided by the user.
""")

@conversationStarter(
  #{
    title: "List repairs",
    text: "List all repairs" 
  }
)

namespace RepairServiceAgent {  
  // Uncomment this part to add actions to the agent.
  @service
  @server(global.RepairsAPI.SERVER_URL)
  @actions(global.RepairsAPI.ACTIONS_METADATA)
  namespace GitHubAPIActions {
    op listRepairs is global.RepairsAPI.listRepairs;
  }
}

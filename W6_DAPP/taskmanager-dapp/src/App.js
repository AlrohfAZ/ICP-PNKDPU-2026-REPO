import { useState, useEffect, useCallback } from "react";
import { ethers } from "ethers";
import "./App.css";
import TaskABI from "./TaskManagerABI.json";

const TaskManagerABI = TaskABI.abi;
const contractAddress = "0x0F2116DDBa4B11DdF43C3dF014eDF76678dd65F4";

function App() {

  const [account, setAccount] = useState(null);
  const [contract, setContract] = useState(null);
  const [description, setDescription] = useState("");
  const [tasks, setTasks] = useState([]);

  async function connectWallet() {

    if (!window.ethereum) {
      alert("Install Metamask");
      return;
    }

    const provider = new ethers.BrowserProvider(window.ethereum);
    const accounts = await provider.send("eth_requestAccounts", []);
    const signer = await provider.getSigner();

    const taskContract = new ethers.Contract(
      contractAddress,
      TaskManagerABI,
      signer
    );

    setAccount(accounts[0]);
    setContract(taskContract);

  }

  const loadTasks = useCallback(async () => {

    if (!contract) return;

    const count = await contract.totalTasks();

    let loadedTasks = [];

    for (let i = 0; i < count; i++) {

    const task = await contract.getTask(i);

    loadedTasks.push({
      id: task.id.toString(),
      description: task.description,
      status: task.status
    });

    }

    setTasks(loadedTasks);

  }, [contract]);

  async function addTask() {

    if (!description) return;

    const deadline = Math.floor(Date.now() / 1000) + 86400;

    const tx = await contract.addTask(description, deadline);

    await tx.wait();

    setDescription("");

    loadTasks();
  }

  async function completeTask(id) {

    const tx = await contract.completeTask(id);

    await tx.wait();

    loadTasks();
  }

  async function deleteTask(id) {

    const tx = await contract.deleteTask(id);

    await tx.wait();

    loadTasks();
  }

  useEffect(() => {
    loadTasks();
  }, [loadTasks]);

  return (

    <div className="App">

      <header className="App-header">

        <h1>TaskManager DApp</h1>

        {!account && (
          <button onClick={connectWallet}>
            Connect Wallet
          </button>
        )}

        {account && (
          <p>Connected: {account}</p>
        )}

        <div>

          <input
            placeholder="New task..."
            value={description}
            onChange={(e) => setDescription(e.target.value)}
          />

          <button onClick={addTask}>
            Add Task
          </button>

        </div>

        <h2>Tasks</h2>

        {tasks.map((task) => (

          <div key={task.id}>

            <p>
              {task.description} — {task.status === 0 ? "Pending" : "Completed"}
            </p>

            {task.status === 0 && (
              <button onClick={() => completeTask(task.id)}>
                Complete
              </button>
            )}

            <button onClick={() => deleteTask(task.id)}>
              Delete
            </button>

          </div>

        ))}

      </header>

    </div>

  );
}

export default App;

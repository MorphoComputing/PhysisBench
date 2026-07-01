# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1HVZ\seeds\seed_0\1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 0.886 A
- tm_score_ca_ordered: 0.4004227290474945
- heavy_atom_rmsd: 2.912 A
- sidechain_heavy_atom_rmsd: 3.602 A
- **all-atom quality (honest):** heavy 2.912 A, sidechain 3.602 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 91
- bin_accuracy: 0.538

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8860214017854886
- ga_delta_rmsd: 1.290698100439101  ga_fitness_mode: energy
- pre_local_rmsd: 0.8859628521001801  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C2 → 5 conflicts (100%)
- explained: 5/5 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.125), conflicts/hub=2.5, max_incompat=2.97Å, chain_span=0.375
- **fix-first:** [LOW_CONFLICT] Root cause(s): C2 — explain ~5/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C2** — severity 2.55, 3 conflict(s); suspect input ~`L5` (group: push_out)
  - push-out (wants farther): R8@20.1Å(now 17.0,conf 0.41)
  - R8↔L5: targets 20.1/8.0Å but partners are 9.3Å apart → too_close_together by 2.9Å
  - R8↔C6: targets 20.1/11.8Å but partners are 5.4Å apart → too_close_together by 3.0Å
  - R8↔R7: targets 20.1/15.2Å but partners are 3.4Å apart → too_close_together by 1.5Å
- **R8** — severity 1.33, 2 conflict(s); suspect input ~`C11` (group: push_out)
  - push-out (wants farther): C2@20.1Å(now 17.0,conf 0.41)
  - C2↔C11: targets 20.1/6.1Å but partners are 12.3Å apart → too_close_together by 1.7Å
  - C2↔L5: targets 20.1/10.5Å but partners are 7.7Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=5 · strand(E)=6 · 3-10(G)=3 · coil(C)=2

```
CHEHGEGHHEEGHECE
```

## Backbone H-bond Network

- total=7 · helix(i→i+4)=2 · sheet=5
  - C4 ↔ R8  (helix)
  - G9 ↔ C13  (helix)
  - R3 ↔ C11  (sheet)
  - R3 ↔ I14  (sheet)
  - R3 ↔ T16  (sheet)
  - C6 ↔ C11  (sheet)
  - C6 ↔ I14  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=43 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=21 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2321 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

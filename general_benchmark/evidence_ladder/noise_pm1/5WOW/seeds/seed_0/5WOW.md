# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 0.571 A
- tm_score_ca_ordered: 0.9014785174596274
- heavy_atom_rmsd: 2.871 A
- sidechain_heavy_atom_rmsd: 3.636 A
- **all-atom quality (honest):** heavy 2.871 A, sidechain 3.636 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 595
- bin_accuracy: 0.649

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5711583977890511
- ga_delta_rmsd: 0.06339730794135734  ga_fitness_mode: energy
- pre_local_rmsd: 0.5711482354887067  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C28-P31 → 5 conflicts (83%)
- explained: 5/6 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.135), conflicts/hub=1.2, max_incompat=3.4Å, chain_span=0.676
- **fix-first:** [LOW_CONFLICT] Root cause(s): C28-P31 — explain ~5/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C10** — severity 1.45, 2 conflict(s); suspect input ~`Y30` (group: push_out)
  - push-out (wants farther): Y30@13.4Å(now 10.7,conf 0.34)
  - C28↔Y30: targets 5.0/13.4Å but partners are 5.9Å apart → too_close_together by 2.5Å
  - G29↔Y30: targets 7.8/13.4Å but partners are 3.8Å apart → too_close_together by 1.7Å
- **G24** — severity 1.16, 1 conflict(s); suspect input ~`Y30` (group: push_out)
  - push-out (wants farther): P31@17.4Å(now 14.4,conf 0.35)
  - Y30↔P31: targets 9.8/17.4Å but partners are 4.1Å apart → too_close_together by 3.4Å
- **C28** — severity 0.78, 1 conflict(s); suspect input ~`R11` (group: push_out)
  - push-out (wants farther): R11@11.1Å(now 8.5,conf 0.34)
  - C10↔R11: targets 5.0/11.1Å but partners are 3.8Å apart → too_close_together by 2.3Å
- **P31** — severity 0.64, 1 conflict(s); suspect input ~`R23` (group: push_out)
  - push-out (wants farther): G24@17.4Å(now 14.4,conf 0.35)
  - G24↔R23: targets 17.4/11.8Å but partners are 3.7Å apart → too_close_together by 1.9Å
- **P35** — severity 0.52, 1 conflict(s); suspect input ~`P4` (group: push_out)
  - push-out (wants farther): P4@13.5Å(now 10.9,conf 0.34)
  - Y32↔P4: targets 7.5/13.5Å but partners are 4.4Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=16 · 3-10(G)=8 · coil(C)=3

```
CGGHEECEGGHEHHHEHEHEEEEHEGEEGGEGHCHEE
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=2 · sheet=46
  - R11 ↔ D15  (helix)
  - D15 ↔ A19  (helix)
  - K5 ↔ C16  (sheet)
  - K5 ↔ G18  (sheet)
  - K5 ↔ C20  (sheet)
  - K5 ↔ I21  (sheet)
  - I6 ↔ C16  (sheet)
  - I6 ↔ G18  (sheet)
  - I6 ↔ C20  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ G18  (sheet)
  - Q8 ↔ C20  (sheet)
  - Q8 ↔ I21  (sheet)
  - Q8 ↔ C22  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ N25  (sheet)
  - Q8 ↔ Y27  (sheet)
  - Q8 ↔ C28  (sheet)
  - R12 ↔ C20  (sheet)
  - R12 ↔ I21  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=130 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=69 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2124 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

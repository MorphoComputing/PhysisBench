# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1EGF/sequence/1EGF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1EGF/seeds/seed_0/1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 5.863 A
- tm_score_ca_ordered: 0.2933579520227928
- heavy_atom_rmsd: 7.187 A
- sidechain_heavy_atom_rmsd: 8.333 A
- **all-atom quality (honest):** heavy 7.187 A, sidechain 8.333 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 235
- bin_accuracy: 0.545

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.8632601516679115
- ga_delta_rmsd: 0.18998171197895886  ga_fitness_mode: energy
- pre_local_rmsd: 5.874275540324538  localized_anchor_rmsd: 5.8632490729608415

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** R47-E50 → 4 conflicts (80%)
- explained: 4/5 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.078), conflicts/hub=1.2, max_incompat=2.72Å, chain_span=0.314
- **fix-first:** [LOW_CONFLICT] Root cause(s): R47-E50 — explain ~4/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C41** — severity 2.80, 2 conflict(s); suspect input ~`W48` (group: push_out)
  - push-out (wants farther): E50@14.9Å(now 11.9,conf 0.55), W48@14.2Å(now 10.8,conf 0.55)
  - S37↔W48: targets 4.6/14.2Å but partners are 6.9Å apart → too_close_together by 2.7Å
  - S37↔E50: targets 4.6/14.9Å but partners are 7.9Å apart → too_close_together by 2.4Å
- **R40** — severity 1.16, 1 conflict(s); suspect input ~`P3` (group: push_out)
  - push-out (wants farther): L51@18.3Å(now 15.1,conf 0.55), P3@13.9Å(now 11.0,conf 0.55)
  - C30↔P3: targets 4.2/13.9Å but partners are 7.6Å apart → too_close_together by 2.1Å
- **R44** — severity 0.92, 1 conflict(s); suspect input ~`W48` (group: push_out)
  - push-out (wants farther): G4@22.4Å(now 19.7,conf 0.67), H21@20.5Å(now 17.3,conf 0.59), I34@7.9Å(now 3.5,conf 0.55), W48@12.3Å(now 3.6,conf 0.55)
  - Y36↔W48: targets 4.1/12.3Å but partners are 6.5Å apart → too_close_together by 1.7Å
- **Y28** — severity 0.91, 1 conflict(s); suspect input ~`N31` (group: push_out)
  - push-out (wants farther): R47@21.4Å(now 18.7,conf 0.61)
  - R47↔N31: targets 21.4/10.6Å but partners are 9.2Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=19 · 3-10(G)=1 · coil(C)=9

```
CEEHHCHEEHHHEGHECEECHHHEHEEECCCECHHEEHEHHHEHHHHHEEC
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=8 · sheet=44
  - S7 ↔ G11  (helix)
  - G11 ↔ N15  (helix)
  - H21 ↔ L25  (helix)
  - I34 ↔ G38  (helix)
  - G38 ↔ Q42  (helix)
  - C41 ↔ D45  (helix)
  - Q42 ↔ L46  (helix)
  - R44 ↔ W48  (helix)
  - Y2 ↔ S8  (sheet)
  - Y2 ↔ V18  (sheet)
  - Y2 ↔ C19  (sheet)
  - P3 ↔ S8  (sheet)
  - P3 ↔ Y9  (sheet)
  - P3 ↔ C13  (sheet)
  - P3 ↔ V18  (sheet)
  - P3 ↔ C19  (sheet)
  - S8 ↔ C19  (sheet)
  - S8 ↔ Y28  (sheet)
  - Y9 ↔ C19  (sheet)
  - Y9 ↔ Y28  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=257 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=157 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2157 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

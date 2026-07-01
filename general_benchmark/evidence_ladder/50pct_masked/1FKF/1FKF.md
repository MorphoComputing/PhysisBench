# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1FKF\seeds\seed_0\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 2.131 A
- tm_score_ca_ordered: 0.8530234499663698
- heavy_atom_rmsd: 3.424 A
- sidechain_heavy_atom_rmsd: 4.140 A
- **all-atom quality (honest):** heavy 3.424 A, sidechain 4.140 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 1721
- bin_accuracy: 0.811

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=2.0126186738954877 -> 1.877983228670388 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.131290031577877
- ga_delta_rmsd: -0.5003851423711574  ga_fitness_mode: energy
- pre_local_rmsd: 2.1342932922994367  localized_anchor_rmsd: 2.131292323912532

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Y79-A80 → 18 conflicts (75%); I55-R56 → 4 conflicts (17%)
- explained: 22/24 conflicts by 2 root cause(s)
- metrics: hubs=9 (frac 0.086), conflicts/hub=2.7, max_incompat=4.56Å, chain_span=0.943
- **fix-first:** [LOW_CONFLICT] Root cause(s): Y79-A80 + I55-R56 — explain ~22/24 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R56** — severity 11.10, 7 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): P91@17.9Å(now 14.1,conf 0.55), P92@16.9Å(now 12.6,conf 0.55), A83@15.1Å(now 8.8,conf 0.55), G85@14.4Å(now 11.2,conf 0.55)
  - Y79↔A83: targets 5.2/15.1Å but partners are 5.4Å apart → too_close_together by 4.6Å
  - A80↔P92: targets 6.6/16.9Å but partners are 7.0Å apart → too_close_together by 3.2Å
  - A80↔A83: targets 6.6/15.1Å but partners are 5.5Å apart → too_close_together by 3.0Å
- **I55** — severity 7.90, 6 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): P92@15.2Å(now 11.6,conf 0.55), P87@15.2Å(now 7.2,conf 0.55), P91@15.7Å(now 11.9,conf 0.55), A83@14.2Å(now 9.2,conf 0.55), G85@12.1Å(now 9.2,conf 0.55)
  - A80↔A83: targets 5.4/14.2Å but partners are 5.5Å apart → too_close_together by 3.3Å
  - A80↔P92: targets 5.4/15.2Å but partners are 7.0Å apart → too_close_together by 2.8Å
  - Y79↔A83: targets 6.4/14.2Å but partners are 5.4Å apart → too_close_together by 2.4Å
- **V1** — severity 4.07, 3 conflict(s); suspect input ~`Y79` (group: push_out)
  - push-out (wants farther): A83@16.9Å(now 12.6,conf 0.55)
  - A83↔Y79: targets 16.9/7.5Å but partners are 5.4Å apart → too_close_together by 4.1Å
  - A83↔A80: targets 16.9/9.7Å but partners are 5.5Å apart → too_close_together by 1.8Å
  - G57↔A83: targets 5.3/16.9Å but partners are 9.9Å apart → too_close_together by 1.6Å
- **A71** — severity 3.15, 2 conflict(s); suspect input ~`Y79` (group: push_out)
  - push-out (wants farther): A83@25.7Å(now 22.3,conf 0.70)
  - A83↔Y79: targets 25.7/17.3Å but partners are 5.4Å apart → too_close_together by 3.0Å
  - A83↔A80: targets 25.7/17.4Å but partners are 5.5Å apart → too_close_together by 2.8Å
- **L73** — severity 2.76, 2 conflict(s); suspect input ~`Y79` (group: push_out)
  - push-out (wants farther): A83@19.5Å(now 16.5,conf 0.57)
  - A83↔Y79: targets 19.5/11.4Å but partners are 5.4Å apart → too_close_together by 2.7Å
  - A83↔A80: targets 19.5/11.6Å but partners are 5.5Å apart → too_close_together by 2.4Å
- **Y79** — severity 1.69, 1 conflict(s); suspect input ~`P87` (group: push_out)
  - push-out (wants farther): P87@16.7Å(now 11.8,conf 0.55), A83@10.9Å(now 5.4,conf 0.55)
  - I55↔P87: targets 6.4/16.7Å but partners are 7.2Å apart → too_close_together by 3.1Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=36 · 3-10(G)=25 · coil(C)=13

```
CCGGCHCEEGHHHEEGGHECGCEGEEEEGHEHEHHEEHHHGHEEEGEEEHEHHEEGHHHGGHHHEEHHEGECGGGGHHEEHHCHGCHCEGEEHEGEEGGGGCCEC
```

## Backbone H-bond Network

- total=64 · helix(i→i+4)=10 · sheet=54
  - E30 ↔ K34  (helix)
  - K34 ↔ S38  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - E53 ↔ G57  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - Q64 ↔ G68  (helix)
  - P77 ↔ Y81  (helix)
  - D78 ↔ G82  (helix)
  - P8 ↔ F14  (sheet)
  - G9 ↔ F14  (sheet)
  - G9 ↔ P15  (sheet)
  - F14 ↔ Q19  (sheet)
  - P15 ↔ V23  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - Y25 ↔ S37  (sheet)
  - Y25 ↔ K43  (sheet)
  - … +44 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=52 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=454 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=264 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7329 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1FKF.ensemble.pdb`)
- RMSF mean=0.081Å max=0.407Å (per-residue in .per_residue.csv)
- most flexible residues: 92, 82, 85, 55, 56

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1FKF.pae.csv`
- mean=0.064Å · max=0.527Å · AlphaFold-PAE analog (low block = rigid unit/domain)

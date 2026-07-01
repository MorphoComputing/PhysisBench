# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\4INS\seeds\seed_0\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 10.330 A
- tm_score_ca_ordered: 0.22004977709091755
- heavy_atom_rmsd: 11.440 A
- sidechain_heavy_atom_rmsd: 12.439 A
- **all-atom quality (honest):** heavy 11.440 A, sidechain 12.439 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 35
- distogram_pairs: 582
- bin_accuracy: 0.603

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_window_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.330013228843551
- ga_delta_rmsd: -0.42904375646484283  ga_fitness_mode: energy
- pre_local_rmsd: 10.330020378458325  localized_anchor_rmsd: 10.330020378458325

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K94 → 62 conflicts (45%); L76 → 22 conflicts (16%); L82 → 13 conflicts (10%)
- explained: 97/137 conflicts by 3 root cause(s)
- metrics: hubs=27 (frac 0.287), conflicts/hub=5.1, max_incompat=9.45Å, chain_span=0.819
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K94 + L76 + L82 — explain ~97/137 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L76** — severity 19.23, 13 conflict(s); suspect input ~`L80` (group: push_out)
  - push-out (wants farther): Q61@27.4Å(now 19.9,conf 0.97), K94@27.0Å(now 14.7,conf 0.85), G88@19.7Å(now 12.8,conf 0.40), A79@6.8Å(now 2.9,conf 0.38), E86@18.4Å(now 11.9,conf 0.37), L82@15.4Å(now 8.2,conf 0.34)
  - K94↔L80: targets 27.0/10.1Å but partners are 7.5Å apart → too_close_together by 9.4Å
  - K94↔A79: targets 27.0/6.8Å but partners are 12.0Å apart → too_close_together by 8.2Å
  - Q61↔G73: targets 27.4/6.8Å but partners are 15.1Å apart → too_close_together by 5.5Å
- **V67** — severity 16.15, 13 conflict(s); suspect input ~`L71` (group: push_out)
  - push-out (wants farther): Y34@27.5Å(now 24.2,conf 1.00), F42@27.5Å(now 20.3,conf 1.00), F43@27.5Å(now 18.1,conf 1.00), V30@27.5Å(now 21.8,conf 1.00), S27@27.5Å(now 24.4,conf 1.00), Y44@27.5Å(now 17.6,conf 1.00), T45@27.5Å(now 15.8,conf 0.99), P46@27.5Å(now 15.8,conf 0.99), K47@27.5Å(now 12.7,conf 0.98), E86@22.7Å(now 17.8,conf 0.37), L82@22.4Å(now 17.0,conf 0.36), G88@21.3Å(now 17.4,conf 0.32), L80@21.0Å(now 17.4,conf 0.30), A79@19.8Å(now 16.7,conf 0.27), Q61@16.7Å(now 6.8,conf 0.21)
  - Y44↔G73: targets 27.5/14.3Å but partners are 5.1Å apart → too_close_together by 8.1Å
  - Y44↔L71: targets 27.5/12.2Å but partners are 7.2Å apart → too_close_together by 8.1Å
  - T45↔L71: targets 27.5/12.2Å but partners are 7.2Å apart → too_close_together by 8.1Å
- **E86** — severity 15.30, 10 conflict(s); suspect input ~`L82` (group: push_out)
  - push-out (wants farther): V30@27.5Å(now 20.6,conf 1.00), S27@27.5Å(now 24.0,conf 1.00), Q61@27.0Å(now 23.9,conf 0.84), L71@23.7Å(now 14.4,conf 0.52), G73@21.9Å(now 15.7,conf 0.46), V67@22.7Å(now 17.8,conf 0.37), L76@18.4Å(now 11.9,conf 0.37), K94@16.0Å(now 6.0,conf 0.34), L80@10.0Å(now 4.5,conf 0.34), A79@12.5Å(now 9.7,conf 0.34)
  - L71↔L82: targets 23.7/4.8Å but partners are 11.8Å apart → too_close_together by 7.1Å
  - L82↔G73: targets 4.8/21.9Å but partners are 12.7Å apart → too_close_together by 4.4Å
  - L82↔L76: targets 4.8/18.4Å but partners are 8.2Å apart → too_close_together by 5.4Å
- **G73** — severity 12.18, 10 conflict(s); suspect input ~`L76` (group: push_out)
  - push-out (wants farther): Q61@27.3Å(now 15.1,conf 0.92), K94@27.2Å(now 18.7,conf 0.90), G88@22.3Å(now 16.2,conf 0.47), E86@21.9Å(now 15.7,conf 0.46), L82@19.8Å(now 12.7,conf 0.40), L80@15.8Å(now 12.2,conf 0.34), A79@12.4Å(now 8.0,conf 0.34)
  - K94↔L76: targets 27.2/6.8Å but partners are 14.7Å apart → too_close_together by 5.7Å
  - L82↔L76: targets 19.8/6.8Å but partners are 8.2Å apart → too_close_together by 4.8Å
  - K94↔L80: targets 27.2/15.8Å but partners are 7.5Å apart → too_close_together by 4.0Å
- **L82** — severity 9.76, 6 conflict(s); suspect input ~`K94` (group: push_out)
  - push-out (wants farther): L29@27.5Å(now 24.6,conf 1.00), S27@27.5Å(now 24.1,conf 1.00), Q61@27.3Å(now 22.7,conf 0.92), L71@21.7Å(now 11.8,conf 0.46), G73@19.8Å(now 12.7,conf 0.40), K94@19.0Å(now 7.5,conf 0.38), V67@22.4Å(now 17.0,conf 0.36), A79@9.1Å(now 6.0,conf 0.34), L76@15.4Å(now 8.2,conf 0.34)
  - E86↔K94: targets 4.8/19.0Å but partners are 6.0Å apart → too_close_together by 8.1Å
  - K94↔G88: targets 19.0/7.3Å but partners are 6.7Å apart → too_close_together by 5.0Å
  - L71↔A79: targets 21.7/9.1Å but partners are 8.0Å apart → too_close_together by 4.7Å
- **L35** — severity 8.43, 6 conflict(s); suspect input ~`G38` (group: push_out)
  - push-out (wants farther): K94@27.5Å(now 14.6,conf 1.00), C25@22.3Å(now 18.5,conf 0.47), I1@22.3Å(now 19.4,conf 0.35), V2@22.3Å(now 19.5,conf 0.35)
  - K94↔G38: targets 27.5/5.6Å but partners are 16.5Å apart → too_close_together by 5.4Å
  - K94↔E39: targets 27.5/8.9Å but partners are 12.5Å apart → too_close_together by 6.1Å
  - K94↔R40: targets 27.5/10.6Å but partners are 12.7Å apart → too_close_together by 4.2Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=21 · 3-10(G)=9 · coil(C)=5

```
CHEEEHHHGHHHHGHHHHHECEEHHCEEGHHHHEHEHEGECHHHEHGGHHHHHHEHHHHHHEHHHHHEHHHHHEHHEHHHHHHHGGHGEHECHE
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=28 · sheet=22
  - V2 ↔ C6  (helix)
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - S8 ↔ L12  (helix)
  - S11 ↔ L15  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - E31 ↔ L35  (helix)
  - L33 ↔ C37  (helix)
  - F42 ↔ P46  (helix)
  - P46 ↔ E50  (helix)
  - E50 ↔ T54  (helix)
  - T54 ↔ S58  (helix)
  - C57 ↔ Q61  (helix)
  - L59 ↔ E63  (helix)
  - Y60 ↔ N64  (helix)
  - Q61 ↔ Y65  (helix)
  - E63 ↔ V67  (helix)
  - Y65 ↔ Q69  (helix)
  - C66 ↔ H70  (helix)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=609 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=372 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.8012 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=35 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`4INS.ensemble.pdb`)
- RMSF mean=2.036Å max=4.879Å (per-residue in .per_residue.csv)
- most flexible residues: 64, 2, 1, 67, 80

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4INS.pae.csv`
- mean=1.14Å · max=6.453Å · AlphaFold-PAE analog (low block = rigid unit/domain)
